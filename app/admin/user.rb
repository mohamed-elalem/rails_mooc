require('date')
require("action_view")
require("action_view/helpers");
include ActionView::Helpers::DateHelper

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :dob, :gender, :avatar, :name, :role_id

  index do
    selectable_column
    id_column
    column "Full name", :name
    column :email
    column "Date of birth", :dob
    column("User type", :role)
    column :avatar do |user|
      image_tag(user.avatar.url(:thumb))
    end
    column :gender
    column :current_sign_in_at
    column :sign_in_count
    # column time_ago_in_words(:created_at)
    column ("Created since") {|user| time_ago_in_words(user.created_at, include_seconds: true) + " ago"}
    column ("Session started") {|user| user.current_sign_in_at ? time_ago_in_words(user.current_sign_in_at, include_seconds: true) + " ago" : "offline"}

    # column :created_at do |user|
    #     time_ago_in_words(user.created_at)
    # end 
    actions
  end

  filter :name
  filter :email
  filter :gender
  filter :dob
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Admin Details" do
      f.input :email, :required => true
      f.input :name, :required => true
      f.input :role, :as => :radio, :required => true
      f.input :dob, :as => :datepicker, start_date: Date.parse("1900-1-1"), end_date: Date.today, :required => true
      f.input :gender, :as => :radio, :required => true
      f.input :avatar, :as => :file, :required => true, :hint => f.object.avatar.present? ? image_tag(f.object.avatar.url(:thumb)) : content_tag(:span, "no avatar yet")
      f.input :password, :required => true
      f.input :password_confirmation, :requried => true
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :avatar do
        image_tag(ad.avatar.url(:thumb))
      end
      
      row :name
      row :email
      row :role
      row :gender
      row :dob

    end
  end
  

end

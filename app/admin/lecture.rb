ActiveAdmin.register Lecture do
  permit_params :title, :content, :attachment, :course_id, :user_id
    
    form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Lecture Details" do
      f.input :title
      f.input :content
      f.input :course
      f.input :user, :as => :select, :collection => User.pluck(:email, :id)
      f.input :attachment, :as => :file, :hint => f.object.attachment.present? ? content_tag(:span, f.object.attachment.url) : content_tag(:span, "no attachment yet")
      
    end
    f.actions
  end
end

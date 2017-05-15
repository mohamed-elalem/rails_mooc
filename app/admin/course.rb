ActiveAdmin.register Course do
    before_action :authenticate_user!
    permit_params :title, :content, :user_id

    index do
        selectable_column
        id_column
        column :title
        column ("User") {|course| course.user.name}
        actions
    end

    form do |f|
        f.inputs "Course Details" do
            f.input :title
            f.input :content, :as => :text
            f.input :user, :as => :select, :collection => User.pluck(:email, :id)
        end
        f.actions
    end
    
end
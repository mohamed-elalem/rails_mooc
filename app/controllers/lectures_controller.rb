require('date')
require("action_view")
require("action_view/helpers");

class LecturesController < InheritedResources::Base
  before_action :set_course, :only => [:create_custom]
  before_action :set_lecture, :only => [:like, :unlike, :spam, :unspam, :show, :comment]
  before_action :set_comment, :only => [:delete_comment]
  include ActionView::Helpers::DateHelper


    def create 
        lecture = Lecture.new(params[:lecture])
        lecture.user = current_user
        lecture.save
    end 

    def like
        current_user.vote_up_for @lecture, :vote_scope => "like"
        redirect_to :back
    end

    def unlike
        current_user.vote_down_for @lecture, :vote_scope => "like"
        redirect_to :back
    end

    def spam
        current_user.vote_up_for @lecture, :vote_scope => "spam"
        redirect_to :back
    end

    def unspam
        current_user.vote_down_for @lecture, :vote_scope => "spam"
        redirect_to :back
    end

    def show
        @comment = Comment.new
    end

    def comment
        comment = @lecture.comments.create
        comment.title = params[:comment][:title]
        comment.comment = params[:comment][:comment]
        comment.user = current_user
        comment.save
        redirect_to action: "show", id: @lecture.id
    end
    

  
  private

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment_name, :attachment, :course_id)
    end

    def set_course
      @course = Course.find(params[:id]);
    end

    def set_lecture
      @lecture = Lecture.find(params[:id])
    end
end


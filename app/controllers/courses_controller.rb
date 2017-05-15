class CoursesController < InheritedResources::Base
  before_action :set_course, only: [:show, :edit, :update, :destroy, :like, :unlike, :spam, :unspam, :new_lecture, :create_lecture, :upvote]
  def create
    course = Course.new
    course.title = params[:course][:title]
    course.content = params[:course][:content]
    course.user = current_user
    course.save
    redirect_to courses_path
  end

  def new_lecture
    @lecture = Lecture.new
  end

  def create_lecture
    lecture = Lecture.new
    lecture.title = params[:lecture][:title]
    lecture.content = params[:lecture][:content]
    lecture.attachment = params[:lecture][:attachment]
    lecture.course = @course
    lecture.user = current_user
    lecture.save
    redirect_to courses_path
  end

  

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :content, :references)
    end


end


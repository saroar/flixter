class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_lesson, :only => [:show]


  def show
    @lesson = Lesson.find(params[:id])
    @comment = Comment.new
  end

  private

  def require_authorized_for_lesson
    if current_user.enrolled_in?(current_lesson.section.course) != true
      redirect_to course_path(current_lesson.section.course), :alert => 'Please enroll in this course to view its lessons'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end

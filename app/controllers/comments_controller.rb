class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.comments.create(comment_params.merge(:user => current_user))
    redirect_to lesson_path(@lesson)
  end

  def show

    @comment = Comment.find(params[:id])
    @sub_comment = SubComment.new
  end


  private

  def comment_params
    params.require(:comment).permit(:title, :message)
  end
end


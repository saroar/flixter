class SubCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @comment = Comment.find(params[:comment_id])
    @comment.sub_comments.create(sub_comment_params.merge(:user => current_user))
    redirect_to lesson_comment_path(@lesson, @comment)
  end

  def show
    @lesson = Lesson.find(params[:lesson_id])
    @sub_comment = SubComment.find(params[:id])
  end

  private

  def sub_comment_params
    params.require(:sub_comment).permit(:message)
  end

end

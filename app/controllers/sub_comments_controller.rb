class SubCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.sub_comments.create(sub_comment_params.merge(:user => current_user))
    redirect_to comment_path(@comment)
  end

  def show
    @comment = Comment.find(params[:comment_id])
  end

  private

  def sub_comment_params
    params.require(:sub_comment).permit(:message)
  end

end

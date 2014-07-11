class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save!
    render json: @comment
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end

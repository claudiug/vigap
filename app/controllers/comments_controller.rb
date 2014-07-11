class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params.permit(:title, :body))
    @comment.save
    render json: @comment
  end
end

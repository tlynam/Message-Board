class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(comment_params[:post_id])
    @comment = Comment.new **comment_params.symbolize_keys, user: current_user
    @comment.save
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit :id, :body, :post_id
  end
end

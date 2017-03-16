class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.ordered.paginate(page: params[:page], per_page:  10)
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
    @comments = @post.comments.ordered
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new **post_params.symbolize_keys, user: current_user

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit :id, :title, :body
  end
end

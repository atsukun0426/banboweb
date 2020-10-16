class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    Post.create(post_params)
  end

  private
    def post_params
      params.permit(:text, :image)
    end
end

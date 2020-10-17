class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all.order(created_at: :desc)
    #@search = Post.search(params[:q])
    #@posts = @search.result.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
  end

  def create
    Post.create(text: post_params[:text], user_id: current_user.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
  end

  def edit
    @post = Post.find(params[:id])
  end

  def updated
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @post = Post.find(params[:id])
    @applies = @post.applies.includes(:user)
  end

  def show_posts
    @user = current_user
    @posts = Post.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end

  private
    def post_params
      params.permit(:text)
    end
end

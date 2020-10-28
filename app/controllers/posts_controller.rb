class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(20)
    # @search = Post.search(params[:q])
    # @posts = @search.result.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿が完了しました!"
      redirect_to user_path(id: current_user.id)
    else
      render 'posts/new'
    end
    # Post.create(text: post_params[:text], user_id: current_user.id)
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
    @comments = @post.comments
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

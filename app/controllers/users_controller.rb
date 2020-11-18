class UsersController < ApplicationController
  require 'pry'
  before_action :sign_in_required, only: [:show]
  def index
    @search_params = user_search_params
    @users = User.search(@search_params).includes(:prefecture)
    # @users = User.all
    # @users = User.where(activated: true).page(params[:page]).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(20)
  end

  private

  def user_search_params
    params.fetch(:search, {}).permit(:name, :prefecture_id)
  end
  # def users_posts
  # @user = User.find(params[:id])
  # @posts = Post.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  # end
end

class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def show
    @user = current_user
    @posts = @user.posts.page(params[:page]).per(20)
  end

  #def users_posts
    #@user = User.find(params[:id])
    #@posts = Post.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  #end
end

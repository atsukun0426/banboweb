class OrganizersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index
    @organizers = Organizer.all
  end

  def show
    @organizer = Organizer.find(params[:id])
    # @posts = @user.posts.page(params[:page]).per(20)
  end
end

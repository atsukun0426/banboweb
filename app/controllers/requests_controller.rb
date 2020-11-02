class RequestsController < ApplicationController
  def index
    @recruitment = Recruitment.find(params[:id])
  end

  def create
    @recruitment = Recruitment.find(params[:recruitment_id])
    @request = @recruitment.requests.build(request_params)
    @request.user_id = current_user.id
    # @request_post = @comment.post
    if @request.save
      # @comment_post.create_notification_comment!(current_user, @comment.id)
      redirect_to user_path(id: current_user.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def request_params
    params.require(:request).permit(:name, :group_name, :content)
  end
end

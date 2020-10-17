class AppliesController < ApplicationController
  def create
    @apply = Apply.create(text: apply_params[:text], post_id: apply_params[:post_id], user_id: current_user.id)
    redirect_to "/posts/#{@apply.post.id}"
  end

  private
    def apply_params
      params.permit(:text, :post_id)
    end
end

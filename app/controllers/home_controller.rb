class HomeController < ApplicationController
  def top
    @recruitments = Recruitment.all.order(created_at: :desc)
    @recruitments = Recruitment.page(params[:page]).per(20).order('updated_at DESC')
  end
end

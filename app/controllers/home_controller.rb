class HomeController < ApplicationController
  def top
    @recruitments = Recruitment.oall.order(created_at: :desc)
    @recruitments = Recruitment.page(params[:page]).per(20).order('updated_at DESC')
  end
end

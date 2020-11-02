class RecruitmentsController < ApplicationController
  def index
    @recruitments = Recruitment.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = current_user.recruitments.build(recruitment_params)
    if @recruitment.save
      flash[:success] = "投稿が完了しました!"
      redirect_to user_path(id: current_user.id)
    else
      render 'recruitments/new'
    end
  end

  def destroy
    recruitment = Recruitment.find(params[:id])
    recruitment.destroy if recruitment.user_id == current_user.id
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
  end

  def updated
    recruitment = Recruitment.find(params[:id])
    recruitment.update(recruitment_params) if recruitment.user_id == current_user.id.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @requests = @recruitment.requests
    @request = Request.new
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:title, :date, :price, :content)
  end
end

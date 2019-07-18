class ManageBectorController < ApplicationController
  before_action :permit_admin

  def index
    @users = User.all
    @microposts = Micropost.all.order(id: :desc).page(params[:page]).per(50)
  end

  def show
    @users = User.all
    @micropost = Micropost.find_by(id:params[:id])
  end

  def update
    @micropost = Micropost.find_by(id:params[:id])
    @micropost.update!(micropost_params)
    redirect_to "/manage_bector", notice: "投稿「#{@micropost.content}」を更新しました。"
  end

  def destroy
    @micropost = Micropost.find_by(id:params[:id])
    @micropost.destroy
    redirect_to "/manage_bector"
  end

  private

  def micropost_params
   params.require(:micropost).permit(:content, :created_at)
  end

  def permit_admin
    unless current_user
      redirect_to root_path
      return
    end
    redirect_to root_path if current_user.authority.general
  end
end

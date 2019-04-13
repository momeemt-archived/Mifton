class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :permit_admin, only: [:index]

  def index
    @users = User.all.order(id: :asc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "ユーザー「#{@user.name}を登録しました。」"
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :authority, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  def permit_admin
    unless current_user
      redirect_to root_path
      return
    end
    redirect_to root_path unless current_user.authority == "admin"
  end

end

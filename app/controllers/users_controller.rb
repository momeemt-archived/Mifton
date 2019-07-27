class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save && verify_recaptcha
      authority = @user.build_authority
      authority.save
      user_traffic = @user.build_user_traffic
      user_traffic.save
      session[:user_id] = @user.id
      redirect_to "/", notice: "ユーザー「#{@user.name}を登録しました。」"
    else
      render action: :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def show
    @user = User.find_by(user_id: params[:id])
  end

  def edit
    if current_user.nil?
      redirect_to root_path
      return
    end
    @user = current_user
  end

  def update
    @user.update!(user_params)
    redirect_to "/", notice: "ユーザー「#{@user.name}」を更新しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_id, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(user_id: params[:id])
  end

end

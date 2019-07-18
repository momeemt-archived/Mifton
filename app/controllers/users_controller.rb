class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @error = []

    if @user.save && verify_recaptcha
      session[:user_id] = @user.id
      redirect_to users_path, notice: "ユーザー「#{@user.name}を登録しました。」"
    else

      if !verify_recaptcha
        @error[0] = "認証に失敗しています"
      end

      if User.find_by(user_id: @user.user_id)
        @error[1] = "既に#{@user.user_id}は存在しています"
      end

      if User.find_by(email: @user.email)
        @error[2] = "既に#{@user.email}は使用されています"
      end

      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def show
    @user = User.find_by(user_id: params[:user_id])
  end

  def edit
    unless current_user == @user && current_user
      redirect_to root_path
      return
    end

  end

  def update
    @user.update!(user_params)
    redirect_to users_url, notice: "ユーザー「#{@user.name}」を更新しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_id, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end

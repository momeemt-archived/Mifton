class HomeController < ApplicationController
  def top
    if !current_user.nil?
      render :top_logined
      @informations = current_user.informations.all
    else
      @user = User.new(user_params)
      @user.user_id = params[:name]
      if @user.save
        redirect_to users_path, notice: "ユーザー「#{@user.name}を登録しました。」"
      else
        render :top_not_logined
      end
    end
  end

  def about
  end

  def authority
    @users = User.all
  end

  private

  def user_params
    params.permit(:name, :user_id, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

class SessionsController < ApplicationController
  def new
    @field = "email";
  end

  def change_login
    if @field = "email"
      @field = "id"
    else
      @field = "email"
    end
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  helper_method :change_login

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

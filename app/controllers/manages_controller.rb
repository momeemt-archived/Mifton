class ManagesController < ApplicationController
  before_action :permit_admin

  def debug
    log_arr =  File.open('log/development.log').readlines
    @logs = Kaminari.paginate_array(log_arr.reverse).page(params[:page]).per(400)
  end

  private

  def permit_admin
    unless current_user
      redirect_to root_path
      return
    end
    redirect_to root_path if current_user.authority.general
  end
end

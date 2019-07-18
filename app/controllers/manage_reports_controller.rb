class ManageReportsController < ApplicationController
  before_action :permit_admin

  def index
    @reports = Report.all
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

class ReportsController < ApplicationController

  def create
    @report = current_user.reports.build(report_params)
    @report.reported_object_id = params[:id]
    @report.reported_object_type = params[:type]

    if @report.save
      redirect_to "/#{params[:type]}"
    else
      render :show
    end
  end

  def show
    @type = params[:type]
    @id = params[:id]
  end

  private
    def report_params
      params.require(:report).permit(:report_reason)
    end
end

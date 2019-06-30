class ManagesController < ApplicationController
  def debug
    log_arr =  File.open('log/development.log').readlines
    @logs = Kaminari.paginate_array(log_arr.reverse).page(params[:page]).per(400)
  end
end

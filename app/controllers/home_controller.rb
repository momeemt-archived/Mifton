class HomeController < ApplicationController
  def top
    @contests = Contest.all.order(start_time: :asc)
  end

  def about
  end
end

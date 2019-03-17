class HomeController < ApplicationController
  def index
    @contests = Contest.all.order(holdingTime: :asc)
  end

  def about
  end

  def privacyPolicy
  end
end

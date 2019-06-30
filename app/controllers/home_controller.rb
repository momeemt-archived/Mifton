class HomeController < ApplicationController
  def top
    @informations = current_user.informations.all if !current_user.nil?
  end

  def about
  end
end

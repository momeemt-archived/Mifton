class CrafesController < ApplicationController
  def top
  end

  def index
    @contests = Contest.all.order(created_at: :desc)
  end
end

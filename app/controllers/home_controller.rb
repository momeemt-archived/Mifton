class HomeController < ApplicationController
  def top
    @contests = Contest.all.order(start_time: :asc)
    @is_contest = false
    @contests.each do |contest|
      if contest.start_time > Time.now
        @is_contest = true
      end
    end
  end

  def about
  end
end

class CrafesController < ApplicationController

  def index
    if login?
      @contests = Contest.all.order(start_datetime: :asc)
      @questions = Question.all.order(start_datetime: :asc)
      render "crafes/logging-in/index"
    else
      @user = User.new
      render "crafes/logged-out/index"
    end
  end

  def about
  end

  def schedule
  end

  def finished
  end

  def show_contest
    @contest = Contest.find(params[:id])
    @questions = Question.all
  end

  def questions
  end

  def show_question
  end

  private

  def set_contest
    @contest = Contest.find(params[:id])
  end

end

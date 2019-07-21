class ManageContestsController < ApplicationController
  include Common
  before_action :permit_admin

  def index
    @contests = Contest.all
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)

    if @contest.save
      redirect_to manage_contests_url
    else
      render :new
    end
  end

  def update
    @contest = Contest.find_by(id:params[:id])
    @contest.update!(contest_params)
    redirect_to manage_contests_url , notice: "投稿「#{@contest.name}」を更新しました。"
  end

  def edit
    @contest = Contest.find_by(id:params[:id])
  end

  def show
    @contest = Contest.find_by(id:params[:id])
  end

  private

  def contest_params
   params.require(:contest).permit(
     :name,
     :times,
     :start_datetime,
     :duration,
     :rated_range,
     :penalty,
     :contest_type,
     :penalty,
     :contest_type,
     :is_public,
     :question1_id,
     :question2_id,
     :question3_id,
     :question4_id
   )
  end

end

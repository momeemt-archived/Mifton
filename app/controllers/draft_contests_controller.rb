class DraftContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  def index
    @contests = DraftContest.all.order(start_time: :asc)
  end

  def new
    @contest = DraftContest.new
  end

  def show
  end

  def create
    @contest = DraftContest.new(contest_params)

    if @contest.save
      redirect_to @contest, notice: "コンテスト草案「#{@contest.name} ##{@contest.holding_times}」を申請・提案しました"
    else
      render :new
    end
  end

  def update
    @contest.update!(contest_params)
    redirect_to contests_url, notice: "コンテスト草案「#{@contest.name}」を更新しました。"
  end

  def edit
  end

  def destroy
    @contest.destroy
    redirect_to draft_contests_url
  end

  def approval
    @contest = DraftContest.find(params[:draft_contest_id])
    @pd_contest = Contest.new(
      name: @contest.name,
      holding_times: @contest.holding_times,
      writer: @contest.writer,
      rating: @contest.rating,
      penalty: @contest.penalty,
      start_time: @contest.start_time,
      contest_type: @contest.contest_type,
      length: @contest.length
    )
    @pd_contest.save!
    @contest.destroy
    redirect_to draft_contests_url
  end

  private

  def set_contest
    @contest = DraftContest.find(params[:id])
  end

  def contest_params
    params.require(:draft_contest).permit(:name, :holding_times,
      :problem_1_name, :problem_1, :problem_1_answer, :submission_limit_1, :executing_sample_1, :execution_result_1, :executing_sample_1_remark,
      :problem_2_name, :problem_2, :problem_2_answer, :submission_limit_2, :executing_sample_2, :execution_result_2, :executing_sample_2_remark,
      :problem_3_name, :problem_3, :problem_3_answer, :submission_limit_3, :executing_sample_3, :execution_result_3, :executing_sample_3_remark,
      :problem_4_name, :problem_4, :problem_4_answer, :submission_limit_4, :executing_sample_4, :execution_result_4, :executing_sample_4_remark,
      :writer, :rating, :penalty, :start_time, :contest_type, :length)
  end
end

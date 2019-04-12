class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]
  before_action :set_problem, only: [:problem_1, :problem_2, :problem_3, :problem_4]
  before_action :set_all_contests, only: [:home, :index]

  def home
  end

  def index
  end

  def show
  end

  def about
  end

  def admin
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)

    if @contest.save
      redirect_to @contest, notice: "コンテスト「#{@contest.name} ##{@contest.holding_times}」を登録しました"
    else
      render :new
    end
  end

  def update
    @contest.update!(contest_params)
    redirect_to contests_url, notice: "コンテスト「#{@contest.name}」を更新しました。"
  end

  def edit
  end

  def destroy
    @contest.destroy
    redirect_to contests_url
  end

  def problem_1
  end

  def problem_2
  end

  def problem_3
  end

  def problem_4
  end

  private

  def contest_params
    params.require(:contest).permit(:name, :holding_times,
      :problem_1_name, :problem_1, :problem_1_answer, :submission_limit_1, :executing_sample_1, :execution_result_1, :executing_sample_1_remark,
      :problem_2_name, :problem_2, :problem_2_answer, :submission_limit_2, :executing_sample_2, :execution_result_2, :executing_sample_2_remark,
      :problem_3_name, :problem_3, :problem_3_answer, :submission_limit_3, :executing_sample_3, :execution_result_3, :executing_sample_3_remark,
      :problem_4_name, :problem_4, :problem_4_answer, :submission_limit_4, :executing_sample_4, :execution_result_4, :executing_sample_4_remark,
      :writer, :rating, :penalty, :start_time, :contest_type, :length)
  end

  def set_contest
    @contest = Contest.find(params[:id])
  end

  def set_problem
    @contest = Contest.find(params[:contest_id])
    @problem_name = [@contest.problem_1_name, @contest.problem_2_name, @contest.problem_3_name, @contest.problem_4_name]
    @problem = [@contest.problem_1, @contest.problem_2, @contest.problem_3, @contest.problem_4]
    @submission_limit = [@contest.submission_limit_1, @contest.submission_limit_2, @contest.submission_limit_3, @contest.submission_limit_4]
    @executing_sample = [@contest.executing_sample_1, @contest.executing_sample_2, @contest.executing_sample_3, @contest.executing_sample_4]
    @execution_result = [@contest.execution_result_1, @contest.execution_result_2, @contest.execution_result_3, @contest.execution_result_4]
    @executing_sample_remark = [@contest.executing_sample_1_remark, @contest.executing_sample_2_remark, @contest.executing_sample_3_remark, @contest.executing_sample_4_remark]
  end

  def set_all_contests
    @contests = Contest.all.order(start_time: :asc)
  end

end

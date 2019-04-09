class ContestsController < ApplicationController
  def index
    @contests = Contest.all.order(start_time: :asc)
  end

  def show
    @contest = Contest.find(params[:id])
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

  def edit
    @contest = Contest.find(params[:id])
  end

  def destroy
    @contest = Contest.find(params[:id])
    @contest.destroy
    redirect_to contests_url
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
end

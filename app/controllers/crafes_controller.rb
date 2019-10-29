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
    @question_1 = Question.find(@contest.question1_id)
    @question_2 = Question.find(@contest.question2_id)
    @question_3 = Question.find(@contest.question3_id)
    @question_4 = Question.find(@contest.question4_id)
    @writers = Set.new([
      @question_1.writer,
      @question_2.writer,
      @question_3.writer,
      @question_4.writer
    ])
    join_data = ContestJoinUser.where(
      user_id: current_user.id,
      contest_id: params[:id]
    )
    @did_join_contest = join_data.present?
    @before_the_contest = @contest.start_datetime > Time.now
    @is_in_session = @contest.start_datetime <= Time.now && @contest.start_datetime + @contest.duration * 60 >= Time.now
    @after_the_contest = @contest.start_datetime + @contest.duration * 60 < Time.now
  end

  def questions
  end

  def show_question
    @question = Question.find(params[:id])
  end

  def join_contest
    join_data = ContestJoinUser.where(
      user_id: current_user.id,
      contest_id: params[:id]
    )
    unless join_data.present?
      join_data = current_user.contest_join_users.build(
        contest_id: params[:id]
      )
      join_data.save
      current_user.contest_records.create(
        contest_id: params[:id]
      )
      flash[:success] = "参加登録しました"
    else
      flash[:fall] = "既に登録されています"
    end
    redirect_to "/crafes/contest/#{params[:id]}"
  end

  def leave_contest
    @join_data = current_user.contest_join_users.find_by(contest_id: params[:id])
    @join_data.destroy
    flash[:leave] = "参加を取り消しました"
    redirect_to "/crafes/contest/#{params[:id]}"
  end

  def standings
    @contest = Contest.find(params[:id])
    @join_users = ContestJoinUser.where(
      contest_id: @contest.id
    )
    @contest_records = ContestRecord.where(
      contest_id: @contest.id
    )

  end

  private

  def set_contest
    @contest = Contest.find(params[:id])
  end

end

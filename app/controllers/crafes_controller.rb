class CrafesController < ApplicationController
  def top
    @contests = Contest.all.order(holdingTime: :asc)
  end
  
  def about 
    @contests = Contest.all.order(holdingTime: :asc)
  end

  def index
    @contests = Contest.all.order(holdingTime: :asc)
  end

  def new
    @contests = Contest.all.order(holdingTime: :asc)
  end
  
  def create
    @contest = Contest.new(
      name: params[:name],times: params[:times],
      q1title: params[:q1title],q1: params[:q1],q2title: params[:q2title],q2: params[:q2],q3title: params[:q3title],q3: params[:q3],q4title: params[:q4title],q4: params[:q4],
      holdingTime: params[:holdingTime],length: params[:length],writer: params[:writer],rating: params[:rating],type:params[:type],penalty:params[:penalty]
    )
    if @contest.save
      flash[:notice] = "大会を登録しました"
      redirect_to("/crafes/index")
    else
      render("crafes/new")
    end
  end
  
  def destroy
    @contest = Contest.find_by(id: params[:id])
    @contest.destroy
    flash[:notice] = "大会を削除しました"
    redirect_to("/crafes/new")
  end

  def contest_request
  end
  
  def contest_submit
  end
  
  def show
    @contest = Contest.find_by(id: params[:id])
  end
  
  def edit
    @contest = Contest.find_by(id: params[:id])
  end
  
  def update
    @contest = Contest.find_by(id: params[:id])
    @contest.name = params[:name]
    @contest.times = params[:times]
    @contest.q1title = params[:q1title]
    @contest.q1 = params[:q1]
    @contest.q2title = params[:q2title]
    @contest.q2 = params[:q2]
    @contest.q3title = params[:q3title]
    @contest.q3 = params[:q3]
    @contest.q4title = params[:q4title]
    @contest.q4 = params[:q4]
    @contest.holdingTime = params[:holdingTime]
    @contest.length = params[:length]
    @contest.writer = params[:writer]
    @contest.rating = params[:rating]
    @contest.contest_type = params[:type]
    @contest.penalty = params[:penalty]
    if @contest.save
      flash[:notice] = "大会を更新しました"
      redirect_to("/crafes/index")
    else
      render("crafes/new")
    end
  end
    
  def question1
    @contest = Contest.find_by(id: params[:id])
  end
  def question2
    @contest = Contest.find_by(id: params[:id])
  end
  def question3
    @contest = Contest.find_by(id: params[:id])
  end
  def question4
    @contest = Contest.find_by(id: params[:id])
  end
  
  def submit
  end
  
  def question_submit
  end
  
  def rank_table
  end
end

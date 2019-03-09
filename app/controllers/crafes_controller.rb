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
      holdingTime: params[:holdingTime],length: params[:length],writer: params[:writer],rating: params[:rating]
    )
    @contest.save
    redirect_to("/crafes/new")
  end
  
  def destroy
    @contest = Contest.find_by(id: params[:id])
    @contest.destroy
    redirect_to("/crafes/new")
  end

  def contest_request
  end
  
  def contest_submit
  end
  
  def show
    @contest = Contest.find_by(id: params[:id])
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

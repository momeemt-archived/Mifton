class ManageQuestionsController < ApplicationController
  before_action :permit_admin

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by(id:params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to "/manage_questions"
    else
      render :new
    end
  end

  private

  def question_params
   params.require(:questions).permit(
     :title,
     :writer,
     :score,
     :content,
     :constraints,
     :input_example,
     :output_example,
     :answer
   )
  end

  def permit_admin
    unless current_user
      redirect_to root_path
      return
    end
    redirect_to root_path if current_user.authority.general
  end
end

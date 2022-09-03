require 'pry'
class AnswersController < ApplicationController
  
  before_action :set_question!, only: [:create, :edit, :update, :destroy]
  before_action :set_answer!, only: [:edit, :update, :destroy]
  
  def create
    @answer = @question.answers.build(answers_params)
    if @answer.save
    flash[:success] = 'Answer save!'
    redirect_to question_path(@question)
    else
      @answers = @question.answers.order created_at: :desc
      render 'questions/show'
    end
  end
  
  def edit
  end
  
  def update
    @answer.update answers_params
    redirect_to question_path(@question)

  end
  
  def destroy
    if @answer.destroy
      flash[:success] = 'You destroy answer!'
      redirect_to question_path(@question)
    else
    end
  end

  private
  
  def set_question!
    @question = Question.find(params[:question_id])
  end
  
  def set_answer!
    @answer = @question.answers.find(params[:id])
  end

  def answers_params
    params.require(:answer).permit(:body)
  end
end
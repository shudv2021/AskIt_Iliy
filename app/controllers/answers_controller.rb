require 'pry'
class AnswersController < ApplicationController
  
  before_action :set_question!, only: [:create, :destroy]
  
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
  
  def destroy
      
    answer = @question.answers.find(params[:id])
    if answer.destroy
      flash[:success] = 'You destroy answer!'
      redirect_to question_path(@question)
    else
    end
  end

  private
  
  def set_question!
    @question = Question.find(params[:question_id])
  end
  
  def answers_params
    params.require(:answer).permit(:body)
  end
end
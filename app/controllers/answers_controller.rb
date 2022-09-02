class AnswersController < ApplicationController
  
  before_action :set_question!, only: [:create]
  
  def create
    @answer = @question.answers.build(answers_params)
    if @answer.save
    flash[:success] = 'Answer save!'
    redirect_to question_path(@question)
    else
      render 'questions/show'
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
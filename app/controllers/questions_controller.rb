class QuestionsController < ApplicationController
      
  before_action :set_question, only: %i[edit update destroy show]
  
  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
  end
  
  def show
    @answer = @question.answers.build    
    @answers = @question.answers.order created_at: :desc
  end
  
  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = 'Your question created!'
      redirect_to questions_path
    else
      render :new
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update 
    if @question.update question_params
      flash[:success] = 'You update queston!'
      redirect_to questions_path
    else
      render :edit
    end
  end
  
  def destroy 
    if @question.delete
      flash[:success] = 'The quesion was destroyed'
      redirect_to questions_path
    else
      render plain: "Ошибка удаления"
    end
  end
  
  private
  
  def question_params 
    params.require(:question).permit(:title, :body)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end
end
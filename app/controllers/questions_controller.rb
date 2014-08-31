class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.create(question_params)

    respond_with @question
  end

  def update
    @question.update(question_params)

    respond_with(@question, location: @question)
  end

  def destroy
    @question.destroy

    respond_with(@question, location: questions_path)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :answer)
    end
end

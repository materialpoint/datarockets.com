class QuestionsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @questions = Question.reverse_all
  end

  def show
    @question = Question.find(params[:id])
  end
end

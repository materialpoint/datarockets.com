class QuestionsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end
end

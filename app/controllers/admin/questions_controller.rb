class Admin::QuestionsController < AdminController
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :authorize_question

  def index
    @questions = Question.all.order(created_at: :desc)
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

    def authorize_question
      authorize(:question, :manage?)
    end

    def question_params
      params.require(:question).permit(:title, :answer)
    end
end

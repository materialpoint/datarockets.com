class Admin::QuestionsController < AdminController
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :authorize_question

  def index
    @questions = Question.reverse_all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    @question.save

    respond_with @question
  end

  def update
    @question.update(question_params)

    respond_with(@question, location: admin_questions_path)
  end

  def destroy
    @question.destroy

    respond_with(@question, location: admin_questions_path)
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

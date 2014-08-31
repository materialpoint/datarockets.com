class Admin::ProjectsController < AdminController
  before_action :set_project, only: [ :edit, :update, :destroy]
  before_action :authorize_project

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    @project.save

    respond_with(@project)
  end

  def update
    @project.update(project_params)
    
    respond_with(@project)
  end

  def destroy
    @project.destroy

    respond_with(@project)
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def authorize_project
      authorize(:project, :manage?)
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end

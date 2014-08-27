class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.create(project_params)

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

    def project_params
      params.require(:project).permit(:name, :description)
    end
end

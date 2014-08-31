class Admin::ProjectsController < ApplicationController
  before_action :set_project, only: [ :edit, :update, :destroy]

  def index
    @projects = Project.all.order(created_at: :desc)
    authorize(@projects, :manage?)
  end

  def new
    @project = Project.new
    authorize(@project, :manage?)
  end

  def edit
    authorize(@project, :manage?)
  end

  def create
    @project = Project.new(project_params)
    authorize(@project, :manage?)

    @project.save

    respond_with(@project)
  end

  def update
    authorize(@project, :manage?)

    @project.update(project_params)
    
    respond_with(@project)
  end

  def destroy
    authorize(@project, :manage?)

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

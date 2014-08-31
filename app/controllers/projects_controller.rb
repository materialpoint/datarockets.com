class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    authorize(@project)
  end
end

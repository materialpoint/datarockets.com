class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @projects = Project.includes_all.sort_by_order
  end

  def show
    @project = Project.includes_all.find(params[:id])
  end
end

class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @projects = Project.includes_all.reverse_all
  end

  def show
    @project = Project.includes_all.find(params[:id])
  end
end

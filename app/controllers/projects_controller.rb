class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @projects = Project.all.includes(:tags, :preview_image, :project_images).order(created_at: :desc)
  end

  def show
    @project = Project.includes(:tags, :preview_image, :project_images).find(params[:id])
  end
end

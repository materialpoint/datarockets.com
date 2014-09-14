class Admin::ProjectsController < AdminController
  before_action :set_project, only: [ :edit, :update, :destroy]
  before_action :authorize_project

  def index
    @projects = Project.reverse_all
  end

  def new
    @project = Project.new

    @project.build_preview_image
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    @project.save

    respond_with(@project, location: admin_projects_path)
  end

  def update
    @project.update(project_params)

    respond_with(@project, location: admin_projects_path)
  end

  def destroy
    @project.destroy

    respond_with(@project, location: admin_projects_path)
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def authorize_project
      authorize(:project, :manage?)
    end

    def project_params
      params.require(:project).permit(:name, :description, :preview_description, project_image_ids: [],
        preview_image_attributes: [:image])
    end
end

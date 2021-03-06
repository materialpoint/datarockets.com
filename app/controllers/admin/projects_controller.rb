class Admin::ProjectsController < AdminController
  before_action :set_project, only: [ :edit, :update, :destroy]
  before_action :authorize_project

  def index
    @projects = Project.includes_all.sort_by_order
  end

  def new
    @project = Project.new

    @project.build_preview_image
    @project.tags.build
  end

  def edit
    @project.build_preview_image if @project.preview_image.blank?
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

  def sort
    @projects = Project.all
    @projects.each do |project|
      project.order = params[:project].index(project.id.to_s) + 1
      project.save
    end
    render nothing: true, status: :ok
  end

  private

    def set_project
      @project = Project.includes_all.find(params[:id])
    end

    def authorize_project
      authorize(:project, :manage?)
    end

    def project_params
      params.require(:project).permit(:name, :description, :preview_description, :order, project_image_ids: [],
        preview_image_attributes: [:image, :id], tags_attributes: [:name, :id, :_destroy], tag_ids: [],
                                     developer_ids: [])
    end
end

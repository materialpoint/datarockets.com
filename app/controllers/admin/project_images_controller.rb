class Admin::ProjectImagesController < AdminController
  def create
    @project_image = ProjectImage.new(project_image_params)

    unless @project_image.save
      render nothing: true, status: 500
    end
  end

  private

    def project_image_params
      params.require(:project_image).permit(:image)
    end
end

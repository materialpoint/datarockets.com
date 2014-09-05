class Admin::ProjectImagesController < AdminController
  def create
    params[:project_image][:image].each do |image|
      params = {}
      params[:image] = image
      
      @project_image = ProjectImage.new(params)

      respond_to do |format|
        if @project_image.save
          format.html { redirect_to admin_projects_path }
          format.json { render :create }
        end
      end
    end
  end
end

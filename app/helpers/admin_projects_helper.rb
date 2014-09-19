module AdminProjectsHelper
  def render_preview_image
    if @project.preview_image && @project.preview_image.persisted?
      image_tag(@project.preview_image.image.url(:thumb))
    end
  end
end

module AdminProjectsHelper
  def render_project_preview_image(project)
    if project.preview_image && project.preview_image.persisted?
      image_tag(project.preview_image.image.url(:thumb))
    end
  end
end

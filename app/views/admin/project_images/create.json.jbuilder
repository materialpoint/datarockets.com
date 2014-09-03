json.project_image do
  json.id @project_image.id
  json.url @project_image.image.url(:large)
end

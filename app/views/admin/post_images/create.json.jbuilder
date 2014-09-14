json.post_image do
  json.id @post_image.id
  json.url @post_image.image.url(:large)
end

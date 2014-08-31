class ProjectImage < Image
  has_attached_file :image, styles: { small:  '50x50', large: '150x150' }
end

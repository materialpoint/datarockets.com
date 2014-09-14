class ChangeImagesToPreviewImages < ActiveRecord::Migration
  def change
    rename_table :images, :preview_images
  end
end

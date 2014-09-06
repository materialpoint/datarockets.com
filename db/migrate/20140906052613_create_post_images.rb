class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.has_attached_file :image
      t.references :post, index: true

      t.timestamps
    end
  end
end

class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.has_attached_file :image
      t.string :image_file_name
      t.string :image_content_type
      t.string :imageable_type
      t.integer :image_file_size
      t.integer :imageable_id
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end

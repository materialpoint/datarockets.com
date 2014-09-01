class CreateProjectImages < ActiveRecord::Migration
  def change
    create_table :project_images do |t|
      t.has_attached_file :image
      t.string :imageable_type
      t.integer :imageable_id
      t.integer :project_id

      t.timestamps
    end
  end
end

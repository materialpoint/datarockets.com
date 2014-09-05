class CreateProjectImages < ActiveRecord::Migration
  def change
    create_table :project_images do |t|
      t.has_attached_file :image
      t.string :imageable_type
      t.references :imageable, polymorphic: true, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end

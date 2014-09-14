class AddPreviewFields < ActiveRecord::Migration
  def change
    add_column :posts, :preview_body, :text
    add_column :projects, :preview_description, :text
  end
end

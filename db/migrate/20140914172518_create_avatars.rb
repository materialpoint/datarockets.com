class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.has_attached_file :image
      t.references :user, index: true

      t.timestamps
    end
  end
end

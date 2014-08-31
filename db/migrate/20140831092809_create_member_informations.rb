class CreateMemberInformations < ActiveRecord::Migration
  def change
    create_table :member_informations do |t|
      t.string :title
      t.text :description
      t.string :github_profile
      t.string :own_blog
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end

class AddProjectDevelopersAndPostAuthors < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.references :post, index: true
      t.references :user, index: true
    end

    create_table :workings do |t|
      t.references :project, index: true
      t.references :user, index: true
    end
  end
end

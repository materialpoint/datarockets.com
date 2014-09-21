class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.references :tag, index: true
      t.references :project, index: true
    end
  end
end

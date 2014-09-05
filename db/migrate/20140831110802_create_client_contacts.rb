class CreateClientContacts < ActiveRecord::Migration
  def change
    create_table :client_contacts do |t|
      t.string :name
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end

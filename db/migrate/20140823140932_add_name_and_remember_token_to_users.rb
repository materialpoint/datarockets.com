class AddNameAndRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :remember_token, :string, null: false
    add_index :users, :remember_token
  end
end

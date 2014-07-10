class AddProperFieldsToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, limit: 100
    add_column :users, :last_name, :string, limit: 100
    add_column :users, :email, :string, unique: true, limit: 100, null: false, default: "email@example.net"
    add_column :users, :password, :string, limit: 200
    add_index :users, :email, name: "user_email_index"
  end
end

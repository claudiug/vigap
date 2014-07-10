class AddAllTheFieldsForUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, limit: 100
    add_column :users, :username, :string, limit: 100
    add_column :users, :last_name, :string, limit: 100
    add_column :users, :email, :string, limit: 100
    add_column :users, :password, :string, limit: 200
  end
end

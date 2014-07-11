class AddFieldsForComments < ActiveRecord::Migration
  def change
    add_column :comments, :title, :string
    add_column :comments, :body, :string
  end
end

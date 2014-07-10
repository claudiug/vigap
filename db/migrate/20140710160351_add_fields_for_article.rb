class AddFieldsForArticle < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string
    add_column :articles, :text, :string
  end
end

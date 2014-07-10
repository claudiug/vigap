class AddProfileForArticle < ActiveRecord::Migration
  def change
    add_column :profiles, :bio, :string
    add_column :profiles, :photo, :string
    add_column :profiles, :rank, :integer
  end
end

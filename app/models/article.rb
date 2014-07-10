class Article < ActiveRecord::Base
  has_many :taggings
  has_many :comments
  has_many :tags, through: :taggings
  belongs_to :user

  def self.tagged_with(name)
    Tag.find_by(name: name).articles
  end

  def self.number_of_tags
    Tag.select("tags*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map { |e| e.name }.join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(", ").map { |e| Tag.where(name: e.strip).first_or_create! }
  end
end

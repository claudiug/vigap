class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates :title, :body, presence: true
end

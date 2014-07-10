class User < ActiveRecord::Base
  has_one :profile
  has_many :articles
  has_many :comments
  has_many :tags
  has_secure_password
  EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :password, on: :create, length: { in: 6..20 }
  validates :username, uniqueness: true, length: { in: 6..20 }
end

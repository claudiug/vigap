class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}

  def username
    "#{first_name.capitalize} #{last_name.capitalize}" if first_name.present? || last_name.present?
  end
end

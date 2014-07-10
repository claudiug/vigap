class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}

  def username
    return email if first_name.nil? && last_name.nil?
    return "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)}" if first_name.present? || last_name.present?
  end
end

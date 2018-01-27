class User < ApplicationRecord
  EMAIL_REGEXP = /\A[^@\s]+@[^@\s]+\z/

  has_secure_password

  validates :email, presence: true
  validates :email, format: { with: EMAIL_REGEXP }
end

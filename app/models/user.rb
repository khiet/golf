class User < ApplicationRecord
  ROLES        = %w(admin organiser)
  EMAIL_REGEXP = /\A[^@\s]+@[^@\s]+\z/

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEXP }
  validates :role, inclusion: { in: ROLES }, allow_nil: true
end

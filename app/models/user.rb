class User < ApplicationRecord

  before_save { self.email = email.downcase } # callback method  self.email.downcase

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX},
            # uniqueness: true
            uniqueness: {case_sensitive: false}
  has_secure_password
  # validates :password, length: {minmum: 6}, presence: true
 validates :password, presence: true, length: { minimum: 6 }

end
class Employee < ActiveRecord::Base
  attr_accessible :address, :email, :name, :sex, :trainer, :document_type, :document_number, :password, :password_confirmation
  has_secure_password

  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    format: { with: VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false }
  validates :document_type, presence: true
  validates :document_number, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


end

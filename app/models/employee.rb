class Employee < ActiveRecord::Base
  attr_accessible :address, :email, :name, :sex, :trainer, :document_type, :document_number, :password, :password_confirmation
  has_secure_password
  has_many :driver_licenses, dependent: :destroy #con esta opcion dependent destroy, si eliminamos un empleado, se eliminan sus licencias de conducir
  accepts_nested_attributes_for :driver_licenses

  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    format: { with: VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false }
  validates :document_type, presence: true
  validates :document_number, presence: true

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end

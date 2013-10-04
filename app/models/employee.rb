class Employee < ActiveRecord::Base
  attr_accessible :address, :email, :name, :sex, :trainer, :document_type, :document_number, :driver_licenses_attributes, :city, :region, :postal_code, :phone, :mobile, :skype, :notes, :country_id, :studies_attributes, :work_schedule, :ppe, :driver_license_codes_attributes
  has_many :driver_licenses, dependent: :destroy #con esta opcion dependent destroy, si eliminamos un empleado, se eliminan sus licencias de conducir
  has_many :studies, dependent: :destroy
  has_many :driver_license_codes
  belongs_to :country


  accepts_nested_attributes_for :driver_licenses, :reject_if => lambda { |a| a[:code].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :studies, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :driver_license_codes
  
  DOCUMENTS = ["Dni", "Lc", "Le", "Pasaporte"]
  CATEGORIES = ["B1", "B2", "B3", "Pasaporte"]

  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    format: { with: VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false }
  validates :document_type, presence: true
  validates :document_number, presence: true, uniqueness: true, numericality: true
  default_scope {where(status: true)}

  def gender_txt
    ["Hombre", "Mujer"][self.sex]
  end

  def document_txt
    ["Dni", "Lc", "Le", "Pasaporte"][self.document_type]
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end  

end

class Employee < ActiveRecord::Base
  attr_accessible :address, :email, :name, :sex, :trainer, :document_type, :document_number, 
                  :city,:region, :postal_code, :phone, :mobile, :skype, :notes,:work_schedule, :ppe,
                  :driver_licenses_attributes,  
                  :country_id, :studies_attributes, 
                  :special_habilitations_attributes
                  
  has_many :driver_licenses, dependent: :destroy #si eliminamos un empleado, se eliminan sus licencias de conducir
  belongs_to :country
  has_many :studies, dependent: :destroy
  has_many :special_habilitations, dependent: :destroy 


  accepts_nested_attributes_for :driver_licenses, :reject_if => lambda { |a| a[:code].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :studies, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :country, :reject_if => lambda { |a| a[:code].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :special_habilitations, :reject_if => lambda { |a| a[:code].blank? }, :allow_destroy => true
  
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

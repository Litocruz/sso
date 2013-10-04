class DriverLicense < ActiveRecord::Base
  attr_accessible :code, :expiration, :description, :driver_license_codes_attributes
  belongs_to :employee
  has_many :driver_license_codes

  accepts_nested_attributes_for :driver_license_codes

  validates :code, presence: true

  default_scope order: 'driver_licenses.created_at DESC'

  def self.search(search)
    if search
      where('code LIKE ?', "%#{search}%")
    else
      scoped
    end
  end 
end

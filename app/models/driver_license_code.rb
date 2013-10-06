class DriverLicenseCode < ActiveRecord::Base
  attr_accessible :code, :description
  has_many :driver_licenses
  has_many :employees, through: :driver_licenses

  accepts_nested_attributes_for :driver_licenses
end

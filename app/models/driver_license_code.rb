class DriverLicenseCode < ActiveRecord::Base
  attr_accessible :code, :description
  belongs_to :driver_license
  belongs_to :employee
end

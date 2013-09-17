class DriverLicense < ActiveRecord::Base
  attr_accessible :code, :expiration
  belongs_to :employee

  validates :code, presence: true

  default_scope order: 'driver_licenses.created_at DESC'
end

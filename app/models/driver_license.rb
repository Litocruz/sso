class DriverLicense < ActiveRecord::Base
  attr_accessible :code, :expiration, :description
  belongs_to :employee

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

class Study < ActiveRecord::Base
  attr_accessible :date, :description, :place, :title
  belongs_to :employee

  validates :title, presence: true

  default_scope order: 'driver_licenses.date DESC'
end

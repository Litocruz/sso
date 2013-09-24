class Country < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :employees

  validates :name, :code, {presence: true, uniqueness: true }

end

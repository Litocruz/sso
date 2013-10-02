class Country < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :employees

  accepts_nested_attributes_for :employees

  validates :name, :code, {presence: true, uniqueness: true }

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end  

end

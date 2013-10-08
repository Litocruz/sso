class MedicalHistory < ActiveRecord::Base
  attr_accessible :date, :exam, :periodical
  belongs_to :employee

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end  
end

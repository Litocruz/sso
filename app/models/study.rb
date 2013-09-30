class Study < ActiveRecord::Base
  attr_accessible :date, :description, :place, :title
  belongs_to :employee

  validates :title, presence: true

  default_scope order: 'studies.date DESC'

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end 
end

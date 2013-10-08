class SpecialHabilitation < ActiveRecord::Base
  attr_accessible :code, :description, :expiration
  belongs_to :employee

  validates :code, presence: true

  #default_scope order: 'special_habilitations.created_at DESC'

  def self.search(search)
    if search
      where('code LIKE ?', "%#{search}%")
    else
      scoped
    end
  end 
end

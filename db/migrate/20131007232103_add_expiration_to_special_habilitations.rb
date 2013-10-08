class AddExpirationToSpecialHabilitations < ActiveRecord::Migration
  def change
    add_column :special_habilitations, :expiration, :date
  end
end

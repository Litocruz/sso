class AddSpecialHabilitationIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :special_habilitation_id, :integer, default: 0
  end
end

class AddEmployeeIdToSpecialHabilitations < ActiveRecord::Migration
  def change
    add_column :special_habilitations, :employee_id, :integer
  end
end

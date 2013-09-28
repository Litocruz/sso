class AddEmployeeIdToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :employee_id, :integer
  end
end

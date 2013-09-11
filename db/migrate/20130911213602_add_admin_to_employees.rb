class AddAdminToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :admin, :boolean, deafult: false
  end
end

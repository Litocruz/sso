class AddCountryIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :country_id, :integer
  end
end

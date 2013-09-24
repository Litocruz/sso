class AddCityAndRegionAndPostalCodeAndPhoneAndModileAndSkypeAndNotesToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :city, :string
    add_column :employees, :region, :string
    add_column :employees, :postal_code, :int
    add_column :employees, :phone, :string
    add_column :employees, :mobile, :string
    add_column :employees, :skipe, :string
    add_column :employees, :notes, :text
  end
end

class CreateDriverLicenseCodes < ActiveRecord::Migration
  def change
    create_table :driver_license_codes do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end

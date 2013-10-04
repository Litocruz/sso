class ChangeDriverLicenseCodeIdForCodeOnDriverLicense < ActiveRecord::Migration
  def up
    rename_column :driver_licenses, :code, :driver_license_code_id
  end

  def down
  end
end

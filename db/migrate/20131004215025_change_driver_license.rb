class ChangeDriverLicense < ActiveRecord::Migration
  def up
    change_table :driver_licenses, id: false do |t|
      t.remove :id
    end
  end

  def down
  end
end

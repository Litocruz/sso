class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code, index: { :unique => true }
      t.string :name, index: { :unique => true }

      t.timestamps
    end
  end
end

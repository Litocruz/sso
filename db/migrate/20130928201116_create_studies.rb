class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :title
      t.string :place
      t.date :date
      t.text :description
      t.integer :employee_id

      t.timestamps
    end
    add_index :studies, [:employee_id, :created_at]
  end
end

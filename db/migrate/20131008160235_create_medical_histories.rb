class CreateMedicalHistories < ActiveRecord::Migration
  def change
    create_table :medical_histories do |t|
      t.string :exam
      t.date :date
      t.boolean :periodical
      t.integer :employee_id

      t.timestamps
    end
  end
end

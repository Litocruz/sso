class AddIndexToEmployeesDocumentNumber < ActiveRecord::Migration
  def change
    add_index :employees, :document_number, unique: true
  end
end

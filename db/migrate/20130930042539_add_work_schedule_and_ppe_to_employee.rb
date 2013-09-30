class AddWorkScheduleAndPpeToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :work_schedule, :string
    add_column :employees, :ppe, :string
  end
end

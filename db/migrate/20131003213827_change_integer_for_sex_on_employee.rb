class ChangeIntegerForSexOnEmployee < ActiveRecord::Migration
  def up
    change_table :employees do |t|
      t.change :sex, :integer
    end
  end

  def down
  end
end

class CreateSpecialHabilitations < ActiveRecord::Migration
  def change
    create_table :special_habilitations do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end

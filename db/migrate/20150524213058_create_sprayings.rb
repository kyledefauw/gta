class CreateSprayings < ActiveRecord::Migration
  def change
    create_table :sprayings do |t|
      t.string :water_amount
      t.string :chemicals_added
      t.integer :plant_id
      t.timestamps null: false
    end
  end
end

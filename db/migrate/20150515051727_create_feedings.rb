class CreateFeedings < ActiveRecord::Migration
  def change
    create_table :feedings do |t|
      t.string :water_amount
      t.string :nutrients_added
      t.string :ppm_level
      t.string :ph_level
      t.integer :plant_id
      t.timestamps null: false
    end
  end
end

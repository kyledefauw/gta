class CreatePlantEntry < ActiveRecord::Migration
  def change
    create_table :plant_entries do |t|
      t.datetime :entry_datetime 
      t.timestamps null: false
    end
  end
end

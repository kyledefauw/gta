class CreatePlantEntry < ActiveRecord::Migration
  def change
    create_table :plant_entries do |t|
      t.datetime :entry_datetime
      t.integer :plant_id
      t.timestamps null: false
    end

    rename_column :sprayings, :plant_id, :plant_entry_id
    rename_column :stage_of_growths, :plant_id, :plant_entry_id
    rename_column :plant_tasks, :plant_id, :plant_entry_id
    rename_column :plant_images, :plant_id, :plant_entry_id
    rename_column :general_notes, :plant_id, :plant_entry_id
    rename_column :feedings, :plant_task_id, :plant_entry_id

  end
end

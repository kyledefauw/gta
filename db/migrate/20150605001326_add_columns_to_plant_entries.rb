class AddColumnsToPlantEntries < ActiveRecord::Migration
  def change
    add_column :plant_entries, :feeding_id, :integer
    add_column :plant_entries, :general_note_id, :integer
    add_column :plant_entries, :plant_image_id, :integer
    add_column :plant_entries, :plant_task_id, :integer
    add_column :plant_entries, :spraying_id, :integer
    add_column :plant_entries, :stage_of_growth_id, :integer
  end
end

class RenameTaskColumnsInThreeTables < ActiveRecord::Migration
  def change
    rename_column :feedings, :task_id, :plant_task_id
    rename_column :general_notes, :task_id, :plant_task_id
    rename_column :stage_of_growths, :task_id, :plant_task_id
  end
end

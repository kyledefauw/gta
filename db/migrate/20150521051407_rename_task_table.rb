class RenameTaskTable < ActiveRecord::Migration
  def change
    rename_table(:tasks, :plant_tasks)
  end
end

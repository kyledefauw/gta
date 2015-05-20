class ChangePlantAssociation < ActiveRecord::Migration
  def change
    rename_column(:feedings, :plant_id, :task_id)
    rename_column(:stage_of_growths, :plant_id, :task_id)
    rename_column(:general_notes, :plant_id, :task_id)

  end
end

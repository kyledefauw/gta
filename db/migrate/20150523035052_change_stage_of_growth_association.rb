class ChangeStageOfGrowthAssociation < ActiveRecord::Migration
  def change
    rename_column :stage_of_growths, :plant_task_id, :plant_id
  end
end

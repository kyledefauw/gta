class AddColumnToStageOfGrowths < ActiveRecord::Migration
  def change
    add_column :stage_of_growths, :plant_id, :integer
  end
end

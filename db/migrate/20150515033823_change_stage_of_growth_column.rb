class ChangeStageOfGrowthColumn < ActiveRecord::Migration
  def change
    change_column :stage_of_growths, :plant_date, :datetime
  end
end

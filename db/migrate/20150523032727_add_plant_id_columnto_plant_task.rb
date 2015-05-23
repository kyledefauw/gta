class AddPlantIdColumntoPlantTask < ActiveRecord::Migration
  def change
    add_column :plant_tasks, :plant_id, :integer
  end
end

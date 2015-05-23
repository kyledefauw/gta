class AddPlantIdColumnToPlantImages < ActiveRecord::Migration
  def change
    add_column :plant_images, :plant_id, :integer
  end
end

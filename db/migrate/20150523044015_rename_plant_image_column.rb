class RenamePlantImageColumn < ActiveRecord::Migration
  def change
    rename_column :plant_images, :plant_image, :plant_picture
  end
end

class CreatePlantsImages < ActiveRecord::Migration
  def change
    create_table :plant_images do |t|
      t.string :plant_image
      t.timestamps null: false
    end
  end
end

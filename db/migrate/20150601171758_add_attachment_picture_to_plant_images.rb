class AddAttachmentPictureToPlantImages < ActiveRecord::Migration
  def self.up
    change_table :plant_images do |t|
      t.attachment :plant_picture
    end
  end

  def self.down
    remove_attachment :plant_images, :plant_picture
  end
end

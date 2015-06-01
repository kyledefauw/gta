class PlantImage < ActiveRecord::Base

  belongs_to :plant_entry

  has_attached_file :plant_picture

  validates_attachment :plant_picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end

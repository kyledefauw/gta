class PlantImage < ActiveRecord::Base

  has_many :plant_entries
  has_many :plants, through: :plant_entries
  
  has_attached_file :plant_picture

  validates_attachment :plant_picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end

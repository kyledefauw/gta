class PlantImage < ActiveRecord::Base

  validates :plant_image, :presence => true

  belongs_to :plant

end

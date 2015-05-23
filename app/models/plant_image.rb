class PlantImage < ActiveRecord::Base

  validates :plant_picture, :presence => true

  belongs_to :plant

end

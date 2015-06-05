class PlantEntry < ActiveRecord::Base

  belongs_to :plant
  belongs_to :plant_task, polymorphic: true
  belongs_to :feedings
  belongs_to :general_notes
  belongs_to :stage_of_growths
  belongs_to :plant_images
  belongs_to :sprayings

end

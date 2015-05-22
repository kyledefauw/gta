class PlantTask < ActiveRecord::Base

  belongs_to :plant
  has_many :feedings
  has_many :stage_of_growths
  has_many :general_notes

end

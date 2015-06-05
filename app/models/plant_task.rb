class PlantTask < ActiveRecord::Base

  has_many :plant_entries
  has_many :plants, through: :plant_entries


end

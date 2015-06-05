class Spraying < ActiveRecord::Base

  validates :water_amount, :chemicals_added, :presence => true

  has_many :plant_entries
  has_many :plants, through: :plant_entries

end

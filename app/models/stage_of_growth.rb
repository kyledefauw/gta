class StageOfGrowth < ActiveRecord::Base

  validates :stage || :pot_size, :plant_date, :presence => true

  has_many :plant_entries
  has_many :plants, through: :plant_entries

end

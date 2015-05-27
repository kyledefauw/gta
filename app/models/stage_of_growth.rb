class StageOfGrowth < ActiveRecord::Base

  validates :stage || :pot_size, :plant_date, :presence => true

  belongs_to :plant

end

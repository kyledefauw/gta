class StageOfGrowth < ActiveRecord::Base

  validates :stage, :plant_date, :presence => true

  belongs_to :plant

end

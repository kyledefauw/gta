class StageOfGrowth < ActiveRecord::Base
  validates :stage, :date, :presence => true

  belongs_to :plant

end

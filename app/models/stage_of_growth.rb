class StageOfGrowth < ActiveRecord::Base

  validates :stage, :plant_date, :presence => true

  belongs_to :plant_task
  has_many :grow_medium

  accepts_nested_attributes_for :grow_medium, allow_destroy: true

end

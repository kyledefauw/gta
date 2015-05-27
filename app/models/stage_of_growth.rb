class StageOfGrowth < ActiveRecord::Base

  validates :stage, :plant_date, :presence => true

  belongs_to :plant
  has_many :grow_medium, dependent: :destroy

  accepts_nested_attributes_for :grow_medium, allow_destroy: true

end

class PlantTask < ActiveRecord::Base

  belongs_to :plant
  has_many :feedings, dependent: :destroy

  accepts_nested_attributes_for :feedings, allow_destroy: true

end

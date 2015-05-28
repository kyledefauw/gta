class PlantEntry < ActiveRecord::Base


  belongs_to :plant

  has_many :plant_tasks, dependent: :destroy
  has_many :feedings, dependent: :destroy
  has_many :general_notes, dependent: :destroy
  has_many :stage_of_growths, dependent: :destroy
  has_many :plant_images, dependent: :destroy
  has_many :sprayings, dependent: :destroy

  accepts_nested_attributes_for :plant_tasks, :feedings, :stage_of_growths, :plant_images, :sprayings
  accepts_nested_attributes_for :general_notes
end

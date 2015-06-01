class PlantEntry < ActiveRecord::Base

  belongs_to :plant

  has_many :plant_tasks, dependent: :destroy
  has_many :feedings, dependent: :destroy
  has_many :general_notes, dependent: :destroy
  has_many :stage_of_growths, dependent: :destroy
  has_many :plant_images, dependent: :destroy
  has_many :sprayings, dependent: :destroy

  accepts_nested_attributes_for :plant_tasks, :allow_destroy => true
  accepts_nested_attributes_for :general_notes, :allow_destroy => true
  accepts_nested_attributes_for :stage_of_growths, :allow_destroy => true
  accepts_nested_attributes_for :feedings, :allow_destroy => true
  accepts_nested_attributes_for :plant_images, :allow_destroy => true
  accepts_nested_attributes_for :sprayings, :allow_destroy => true
end

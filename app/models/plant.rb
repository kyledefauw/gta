class Plant < ActiveRecord::Base
  attr_accessor :plant_picture
  validates :strain_name, :presence => true

  belongs_to :crop

  has_many :plant_entries, dependent: :destroy
  has_many :feedings, through: :plant_entries
  has_many :general_notes, through: :plant_entries
  has_many :plant_images, through: :plant_entries
  has_many :plant_tasks, through: :plant_entries
  has_many :sprayings, through: :plant_entries
  has_many :stage_of_growths, through: :plant_entries

  accepts_nested_attributes_for :plant_tasks, :allow_destroy => true
  accepts_nested_attributes_for :general_notes, :allow_destroy => true
  accepts_nested_attributes_for :stage_of_growths, :allow_destroy => true
  accepts_nested_attributes_for :feedings, :allow_destroy => true
  accepts_nested_attributes_for :plant_images, :allow_destroy => true
  accepts_nested_attributes_for :sprayings, :allow_destroy => true

end

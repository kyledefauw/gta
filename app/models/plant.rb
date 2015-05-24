class Plant < ActiveRecord::Base
  attr_accessor :plant_picture, :crop_id
  validates :strain_name, :presence => true

  belongs_to :crop
  has_many :plant_tasks
  has_many :feedings, through: :plant_tasks
  has_many :general_notes
  has_many :stage_of_growths
  has_many :plant_images

  mount_uploader :plant_picture, ImageUploader

end

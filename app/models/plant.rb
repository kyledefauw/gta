class Plant < ActiveRecord::Base
  attr_accessor :plant_picture
  validates :strain_name, :presence => true

  belongs_to :crop

  has_many :plant_tasks, dependent: :destroy
  has_many :feedings, through: :plant_tasks, dependent: :destroy
  has_many :general_notes, dependent: :destroy
  has_many :stage_of_growths, dependent: :destroy
  has_many :plant_images, dependent: :destroy
  has_many :sprayings, dependent: :destroy

  mount_uploader :plant_picture, ImageUploader

end

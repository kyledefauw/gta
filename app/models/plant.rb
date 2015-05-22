class Plant < ActiveRecord::Base
  validates :strain_name, :presence => true

  belongs_to :crop
  has_many :plant_tasks
  has_many :plant_images

  mount_uploader :image, ImageUploader

end

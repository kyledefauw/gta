class Plant < ActiveRecord::Base
  attr_accessor :plant_picture
  validates :strain_name, :presence => true

  belongs_to :crop

  has_many :plant_entries, dependent: :destroy

  mount_uploader :plant_picture, ImageUploader

end

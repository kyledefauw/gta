class GeneralNote < ActiveRecord::Base

  validates :notes, :presence => true

  has_many :plant_entries
  has_many :plants, through: :plant_entries
  
end

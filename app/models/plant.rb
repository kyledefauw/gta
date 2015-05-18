class Plant < ActiveRecord::Base
  validates :strain_name, :presence => true

  belongs_to :crop
  has_many :stage_of_growths
  has_many :feedings
  has_many :general_notes

end

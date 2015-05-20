class Task < ActiveRecord::Base

  belongs_to :plant
  has_many :feedings
  has_many :stage_of_grothss
  has_many :general_notes

end

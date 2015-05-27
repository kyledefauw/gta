class Spraying < ActiveRecord::Base

  validates :water_amount, :chemicals_added, :presence => true

  belongs_to :plant_entry

end

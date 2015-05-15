class Feeding < ActiveRecord::Base

  validates :water_amount || :nutrients_added, :presence => true

  belongs_to :plant

end

class GrowMedia < ActiveRecord::Base

  validates :brand || :nutrients_added, :presence => true

  belongs_to :stage_of_growth

end

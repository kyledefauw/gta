class GardenUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :garden

end

class Plant < ActiveRecord::Base
  validates :strain_name, :presence => true

  belongs_to :crop
  has_many :stage_of_growths

end

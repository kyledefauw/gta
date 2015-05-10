class Garden < ActiveRecord::Base
  validates :name, :presence => true

  has_many :crops

end

class Garden < ActiveRecord::Base
  validates :name, :presence => true

  has_many :crops, dependent: :destroy
  has_many :plants, through: :crops

end

class Crop < ActiveRecord::Base
  validates :name, :presence => true

  belongs_to :garden
  has_many :plants, dependent: :destroy

end

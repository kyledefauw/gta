class GeneralNote < ActiveRecord::Base

  validates :notes, :presence => true

  belongs_to :plant

end
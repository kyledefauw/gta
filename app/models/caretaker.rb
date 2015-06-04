class Caretaker < ActiveRecord::Base

has_many :garden_workers
has_many :gardens, through: :garden_workers

end

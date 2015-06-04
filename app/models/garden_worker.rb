class GardenWorker < ActiveRecord::Base
  belongs_to :garden
  belongs_to :caretaker
end

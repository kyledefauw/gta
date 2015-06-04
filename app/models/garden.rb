class Garden < ActiveRecord::Base
  validates :name, :presence => true

  has_many :crops, dependent: :destroy

  belongs_to :user

  has_many :garden_workers
  has_many :caretakers, through: :garden_workers


end

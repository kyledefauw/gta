class User < ActiveRecord::Base
  validates :username, :email, :presence => true
  validates :email, :uniqueness => true

  has_secure_password

  has_and_belongs_to_many :gardens

end

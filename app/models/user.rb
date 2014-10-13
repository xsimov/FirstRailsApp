class User < ActiveRecord::Base
  validates :username, :email, :firstname, :lastname, presence: true
  has_secure_password validations: false
  has_many :visits
  has_many :locations
end

class User < ActiveRecord::Base
	has_many :visits
  validates :user_name, format: { with: /\A[A-Za-z0-9]*\z/ }
end
class Visit < ActiveRecord::Base
	belongs_to :location
	scope :last_created, ->(value) {Visit.last(value)}
end

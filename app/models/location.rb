class Location < ActiveRecord::Base

	scope :ideed, -> { order("ID") }

	def self.iron_find(id)
		where(id: id).first       #limit 1!!
	end

	def self.last_created(n)
		Location.ideed.limit(n)
	end

	def in_spain?
		return true unless country == nil
		return false
	end
end

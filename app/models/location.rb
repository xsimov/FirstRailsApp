class Location < ActiveRecord::Base

	def self.iron_find(id)
		where(id: id).first       #limit 1!!
	end
end

class Location < ActiveRecord::Base
	has_many :visits
	belongs_to :user

	validates :name, :city, presence: true
	validates :name, uniqueness: true
	def self.iron_find (value)
		Location.where(id: value).first
	end

	scope :last_created, ->(value) { Location.last(value) }

	def self.in_spain? 
		if Location.country == 'Spain'
			
		end
	end

	def total_number_visits_month(month, year)
		return nil if month == nil or year == nil
		date_start = Time.new(year, month, 1)
		date_end = date_start + 1.month - 1.day
		visits_month = self.visits.where(from_date: date_start..date_end)
		visits_month.length
	end
end

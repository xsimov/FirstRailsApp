class Visit < ActiveRecord::Base
	belongs_to :location
	belongs_to :user
	scope :last_created, ->(value) { Visit.last(value) }

	validates :user_name, :from_date, :to_date, :location_id, presence: true
	validates :user_name, format: { with: /\A[A-Za-z0-9]*\z/ }
	validate :from_date_is_in_the_future
	validate :to_date_is_before_from_date

	def from_date_is_in_the_future
		if from_date.to_i < Time.now.to_i
			errors.add(:from_date, "is in the past!")
		end
	end

	def to_date_is_before_from_date
		if from_date.to_i > to_date.to_i
			errors.add(:to_date, "is before from_date")
		end
	end
end

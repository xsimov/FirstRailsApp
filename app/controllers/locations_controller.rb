class LocationsController < ApplicationController
	def index
		@locations = Location.last_created(10)
	rescue ActiveRecord::RecordNotFound
		render plain: "404 Not found", status: 404
	end
end

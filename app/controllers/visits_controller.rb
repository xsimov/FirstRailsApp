class VisitsController < ApplicationController

	def index
		@location = Location.find(params[:location_id])
		@visits = Visit.where(location: params[:location_id]).order(created_at: :desc).last_created(10)
	end

	def show
		@location = Location.find(params[:location_id])
		@visits = Visit.where(location: params[:location_id]).find(params[:id])
	rescue ActiveRecord::RecordNotFound
		render 'not_found', status: 404
	end

	def new
		@location = Location.find params[:location_id]
		@visit = Visit.new
	end

	def create

		@location = Location.find(params[:location_id])
		@visit = @location.visits.new visit_params

		if params[:cancel]
			redirect_to location_path(@location)
		else
			if @visit.save
				# redirect_to action: 'index', controller: 'visits', location_id: @location.id
				redirect_to location_visits_path @location
			else
				render 'new'
			end
		end
	end

	def destroy
		visit = Visit.find(params[:id])
		location = Location.find(params[:location_id])
		if visit.destroy
			redirect_to location_visits_path location
		else
			render "could_not_find"
		end
	end

	private
	def visit_params
		params.require(:visit).permit(:user_name, :from_date, :to_date)
	end

end
class VisitsController < ApplicationController

	def index
		@location = Location.find(params[:location_id])
		@visits = Visit.where(location: params[:location_id]).order(created_at: :desc).last_created(10)
		@user_name = {}
		@visits.each do |visit|
			@user_name[visit.id] = User.find(visit.user_id).user_name
		end
	end

	def show
		@location = Location.find(params[:location_id])
		@visits = Visit.find(params[:id])
		@user_name = User.find(@visits.user_id).user_name
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
				flash[:notice] = "Visit created!"
			else
				render 'new'
			end
		end
	end

	def destroy
		visit = Visit.find(params[:id])
		@location = Location.find(params[:location_id])
		if visit.destroy
			redirect_to location_visits_path @location
		else
			render "could_not_find"
		end
	end

	def edit
		@visit = Visit.find(params[:id])
		@location = Location.find(@visit.location_id)
	end

	def update
		@visit = Visit.find(params[:id])
		@location = Location.find(params[:location_id])
		if @visit.update_attributes visit_params
			redirect_to location_visits_path @visit.location_id
		else
			render 'edit'
		end
	end

	private
	def visit_params
		params.require(:visit).permit(:user_id, :from_date, :to_date)
	end

end
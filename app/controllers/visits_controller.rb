class VisitsController < ApplicationController

	def index
		@visits = Visit.where(location: params[:location_id]).order(created_at: :desc).last_created(10)
	end
	def show
		@visits = Visit.where(location: params[:location_id]).find(params[:id])
	rescue ActiveRecord::RecordNotFound
		render 'not_found', status: 404
	end
end
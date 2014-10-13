class LocationsController < ApplicationController

  def show
    redirect_to location_visits_path(params[:id])
  end

  def create
    location = Location.new location_params
    if location.save
      render text: {process: "SAVED"}.to_json
    else
      render text: {process: "ERROR"}.merge(location.errors.messages).to_json, status: 500
    end
  end

  def update
    location = Location.find(params[:id])
    location.update_attributes location_params
    render text: {process: "UPDATED"}.merge(location.attributes).to_json
  rescue
    render text: {process: "ERROR"}.merge(location.errors.messages).to_json, status: 500
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    render text: {process: "DELETED"}.to_json
  rescue
    render text: {process: "ERROR"}.merge(location.errors.messages).to_json, status: 500
  end

  def location_params
      params.require(:location).permit(:name, :city, :country, :description, :zip_code, :street, :user_id)
  end
end
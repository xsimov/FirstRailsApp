class LocationsController < ApplicationController
  def index
    @locations = Location.order(created_at: :desc).last_created(10)
  end

  def show
    @location = Location.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'not_found', status: 404
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params
    if params[:cancel]
      redirect_to locations_path
    elsif @location.save
      flash[:notice] = "Congratulations, location was created!"
      redirect_to location_path(@location)
    else
      render 'new'
    end
  end

  def edit
      @location = Location.find(params[:id])
      render text: "YOU SHALL NOT EDIT!" unless current_user.id == @location.user_id
  end

  def update
      @location = Location.find(params[:id])
      if params[:cancel]
          redirect_to locations_path
      elsif @location.update location_params
          flash[:notice] = "Congratulations, location was updated!"
          redirect_to location_path
      else
          render 'edit'
      end
  end

  def destroy
      @location = Location.find(params[:id])
      if current_user.id == @location.user_id
        @location.delete
        flash[:notice] = "Congratulations, location was deleted!"
        redirect_to locations_path
      else
        render text: "YOU SHALL NOT DESTROY OTHER PEOPLE'S LOCATIONS!!"
      end
  end

  def show
      @location = Location.find(params[:id])
      render plain: '404 not_found', status: 404 unless @location
  end

  def location_params
      params.require(:location).permit(:name, :city, :country, :description, :zip_code, :street, :user_id)
  end
end
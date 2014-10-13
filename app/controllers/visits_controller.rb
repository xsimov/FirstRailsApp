class VisitsController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @visits = Visit.all
  rescue ActiveRecord::RecordNotFound
    render text: 'NOT FOUND', status: 404
  end

  def create
    location = Location.find(params[:location_id])
    visit = location.visits.new visit_params
    if visit.save
      render text: {process: "SAVED"}.to_json
    else
      render text: {process: "ERROR"}.merge(visit.errors.messages).to_json, status: 500
    end
  end

  def destroy
    visit = Visit.find(params[:id])
    visit.destroy
    render text: {process: "DELETED"}.to_json
  rescue
    render text: {process: "ERROR"}.merge(visit.errors.messages).to_json, status: 500
  end

  def update
    visit = Visit.find(params[:id])
    visit.update_attributes visit_params
    render text: {process: "UPDATED"}.merge({user: user.attributes}).to_json
  rescue
    render text: {process: "ERROR"}.merge(visit.errors.messages).to_json, status: 500
  end

  private
  def visit_params
    params.require(:visit).permit(:user_id, :from_date, :to_date)
  end

end
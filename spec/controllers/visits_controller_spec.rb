require 'rails_helper'

RSpec.describe VisitsController, :type => :controller do

	context 'show' do

		before(:each) do
			@location = Location.create name: "mob", city: "Barcelona"
			@visit = Visit.create location_id: @location.id, user_id: 1, from_date: Time.now + 1.week, to_date: Time.now + 2.weeks
		end

		it "has a 200 status code" do
	      	get :show,  {location_id: @visit.location_id, id: @visit.id}
	      	expect(response.status).to eq(200)
	    end

		it "renders show view" do
			get :show, {location_id: @visit.location_id, id: @visit.id}
			expect(response).to render_template(:show)
		end

		it "has a 404 status code" do
	    	get :show,  {location_id: @visit.location_id, :id => 3000}
	   		expect(response.status).to eq(404)
	    end
	end

	context "create" do
		before(:each) do
		  @location = Location.create name: "Wok", city: "Barcelona"
		  @visit = Visit.create location_id: @location.id, user_id: 1, from_date: Time.now + 1.day, to_date: Time.now + 2.day
		end

		it "renders the specific location when canceled" do
				post :create, {location_id: @visit.location_id, cancel: "pressed", visit: @visit.attributes }
				expect(response).to redirect_to("/locations/#{@location.id}")
		end

		it "creates the element passed" do
			post :create, {location_id: @visit.location_id, visit: @visit.attributes }
			expect(Visit.find(@visit.id)).to eq(@visit)
		end
	end

end
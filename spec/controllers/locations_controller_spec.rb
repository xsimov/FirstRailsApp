require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do

	context 'show' do

		before(:each) do
			@loc = Location.create name: "MOB", city: "Barcelona"
		end

		it "has a 200 status code" do
      	get :show,  {:id => @loc.id}
      	expect(response.status).to eq(200)
    end

		it "renders show view" do
			get :show, {:id => @loc.id}
			expect(response).to render_template(:show)
		end

		it "has a 404 status code" do
      	get :show,  {:id => 3000}
      	expect(response.status).to eq(404)
    end

	end

end
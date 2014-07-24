require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	context 'index' do
	
		it "has a 200 status" do
			get :index
			expect(response.status).to eq(200)
		end

		it "renders index" do
			get :index
			expect(response).to render_template("index")
		end

		it "fetches all users" do
			get :index
			expect(assigns(:all_users).length).to eq(User.all.length)
		end
	end

	context 'show' do

		before(:each) do
		  @user = User.create user_name: "xsimov", first_name: "Xavier", last_name: "Simó"
		end

		it "has a 200 status" do
			get :show, { id: @user.id }
			expect(response.status).to eq(200)
		end

		it "renders show" do
			get :show, { id: @user.id }
			expect(response).to render_template("show")
		end

		it "fetches all users" do
			get :show, { id: @user.id }
			expect(assigns(:user)).to eq(User.find(@user.id))
		end

	end

end

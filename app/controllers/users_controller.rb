class UsersController < ApplicationController

	def index
		@all_users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = params[:user].attributes
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

end

class UsersController < ApplicationController

	def index
		@all_users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		render '/visits/not_found', status: 404
	end

	def create
		@user = params[:user].attributes
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

private
	def user_params
		params.require(:user).permit(:user_name, :first_name, :last_name, :password, :email)
	end
end

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new user_params
    if user.save
      render text: {process: "SAVED"}.to_json
    else
      render text: {process: "ERROR"}.merge(user.errors.messages).to_json, status: 500
    end
  end

  def update
    user = User.find(params[:id])
    user.update_attributes user_params
    render text: {process: "UPDATED"}.merge({user: user.attributes}).to_json
  rescue ActiveRecord::RecordNotFound
    render text: "RecordNotFound!", status: 400
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render text: {process: "DELETED"}.to_json
  rescue ActiveRecord::RecordNotFound
    render text: "RecordNotFound!", status: 400
  end

private
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password)
  end
end

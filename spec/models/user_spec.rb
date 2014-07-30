require 'rails_helper'

RSpec.describe User, :type => :model do

	context "creation" do

		it "has all properties" do
      @user = FactoryGirl.create(:user)
      expect(User.find(@user.id)).to eq(@user)
    end

    it "is valid" do
			@user = FactoryGirl.build(:user_name_invalid)
      expect(@user).not_to be_valid
    end

	end


end

require 'rails_helper'

RSpec.describe User, :type => :model do

	context "creation" do

		it "has all properties" do
			var = User.create user_name: "xsimov", first_name: "Xavier", last_name: "Simó"
			expect(User.find(var.id)).to eq(var)
		end

	end


end

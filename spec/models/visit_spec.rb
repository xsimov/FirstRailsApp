require 'rails_helper'

RSpec.describe Visit, :type => :model do

	context 'time validations' do
		before(:each) do
		  @visit = FactoryGirl.create(:visit)
		end

		it "from_date is in the future" do
			expect(@visit.errors[:from_date]).to be_empty
		end

		it "to_date is before from_date" do
			expect(@visit.errors[:to_date]).to be_empty
		end

	end
end
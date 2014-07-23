require 'rails_helper'

RSpec.describe Visit, :type => :model do

	context 'time validations' do
		before(:each) do
			location_params = {
				name: "Semester",
				city: "Paris",
				country: "France",
				zip_code: "00573",
				description: "Oh là là",
				street: "Rue del Percebe, 13"
			}
			@paris = Location.create location_params
			visit_params = {
				user_name: "JoseLuis",
				from_date: (Time.now + 1.month),
				to_date: (Time.now + 2.month),
				location_id: @paris.id
			}
		  @visit = Visit.new visit_params
		end

		it "from_date is in the future" do
			expect(@visit.errors[:from_date]).to be_empty
		end

		it "to_date is befor from_date" do
			expect(@visit.errors[:to_date]).to be_empty
		end

	end
end

expect(subject).to eql(value)
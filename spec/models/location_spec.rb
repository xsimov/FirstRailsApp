require 'rails_helper'

RSpec.describe "iron_find super-method", :type => :model do

	before(:each) do
	  Location.create id: 1, name: 'Home', city: 'Barcelona'
	end

  it "finds the same as .find" do
  	l = Location.find 1
  	l2 = Location.iron_find 1
  	expect(l).to eq(l2)
  end
end

RSpec.describe "last_created method", :type => :model do

	before(:each) do
	  @l1 = Location.create id: 1, name: 'Home', city: ''
	  @l2 = Location.create id: 2, name: 'Work', city: 'Barcelona'
	end

  it "returns the last n created locs" do
  	last = Location.last_created(10)
  	expect(last).to eq([@l1, @l2])
  end
end

require 'rails_helper'

RSpec.describe "iron_find super-method", :type => :model do

  before(:each) do
    FactoryGirl.create(:location)
  end

  it "finds the same as .find" do
    l = Location.find 1
    l2 = Location.iron_find 1
    expect(l).to eq(l2)
  end
end

RSpec.describe "Location class", :type => :model do

  before(:each) do
    @l1 = FactoryGirl.create(:location)
    @l2 = FactoryGirl.create(:location)
  end

  it "returns the last n created locs" do
    last = Location.last_created(10)
    expect(last).to eq([@l1, @l2])
  end

  it "is valid" do
    expect(@l1).to be_valid
  end

  it "name is valid (unique and present)" do
    expect(@l1.errors[:name]).to be_empty
  end
end
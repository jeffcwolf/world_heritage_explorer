require_relative 'traveler'

describe Traveler do

  before do
    @traveler1 = Traveler.new("Jane")
    @it1 = Itinerary.new("Germany")
    @it2 = Itinerary.new("North America")
    @it3 = Itinerary.new("Central Europe")
  end

  it "initializes with name" do

    expect(@traveler1.name).to eq("Jane")

  end

end

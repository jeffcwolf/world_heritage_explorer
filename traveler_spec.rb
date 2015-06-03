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

  it "initializes with blank itineraries collection" do

    expect(@traveler1.itineraries).to eq([])

  end

  it "adds an itinerary to itineraries collection" do

    expect(@traveler1.add_itinerary(@it2)). to eq(@traveler1.itineraries << @it2)

  end

  it "lists associated itineraries from collection"


end

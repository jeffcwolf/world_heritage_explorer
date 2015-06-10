require_relative 'itinerary'

describe Itinerary do

  before do
    $stdout = StringIO.new
    @it = Itinerary.new("Germany")
  end

  it "initializes with a name" do

    expect(@it.name).to eq("Germany")

  end

  it "initializes with an empty array"

  it "has a string representation"

  context "has a set of search methods"

end

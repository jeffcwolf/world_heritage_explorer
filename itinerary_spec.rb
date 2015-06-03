require_relative 'itinerary'

describe Itinerary do

  before do
    $stdout = StringIO.new
    @it = Itinerary.new("Jane")
    @initial_interest = 5
    @site1 = Site.new("Aachen", "Germany", "Europe and North America", "cultural", "It is Emperor Charlemagne´s own Palatine Chapel, which constitutes the nucleus of the Cathedral of Aachen, located in western Germany", @initial_interest)
  end

  it "initializes with a name" do

    expect(@it.name).to eq("Jane")

  end

  it "adds a site" do

    @it.add_site(@site1)

    expect(@it.sites).to eq(@it.sites.push(@site1))

  end


end

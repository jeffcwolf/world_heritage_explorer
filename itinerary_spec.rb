require_relative 'itinerary'

describe Itinerary do

  before do
    $stdout = StringIO.new
    @site1 = Site.new("Aachen", "Germany", "Europe and North America", "cultural", "It is Emperor Charlemagne´s own Palatine Chapel, which constitutes the nucleus of the Cathedral of Aachen, located in western Germany")
    @site2 = Site.new("masada", "israel", "Europe and North America", "natural", "Masada is a dramatically located site of great natural beauty overlooking the Dead Sea, a rugged natural fortress on which the Judaean king Herod the Great constructed a sumptuous palace complex in classical Roman style")
    @it = Itinerary.new("Germany")
  end

  it "initializes with a name" do

    expect(@it.name).to eq("Germany")

  end

  it "adds a site" do

    @it.add_site(@site1)

    expect(@it.sites).to eq(@it.sites.push(@site1))

  end

  context "created with sites in its collection" do

    before do
      @it.add_site(@site1)
      # @it.add_site(@site2)
    end

    #The following does not work for some reason?
    it "prints a list of the names of the sites in its collection" do

      expect(@it.site_listing).to eq(@site1.name)

    end

    #How to test this? Piece by piece?
    it "prints a series of stats about itself"

  end

end

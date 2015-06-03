require_relative 'site'

describe Site do

  context "created with certain default parameters" do

    before do
      $stdout = StringIO.new
      @site = Site.new("Aachen", "Germany", "Europe and North America", "cultural")
    end

    it "has a name initialized" do

      expect(@site.name).to eq("Aachen")

    end

    it "has a country initialized" do

      expect(@site.country).to eq("Germany")

    end

    it "has a region initialized" do

      expect(@site.region).to eq("Europe and North America")

    end

    it "has a type initialized" do

      expect(@site.type).to eq("cultural")

    end

    it "has a default blank description initialized" do

      expect(@site.description).to eq("")

    end


  end

  context "created with full parameters" do

    before do
      $stdout = StringIO.new
      @site = Site.new("Aachen", "Germany", "Europe and North America", "cultural", "It is Emperor Charlemagne´s own Palatine Chapel, which constitutes the nucleus of the Cathedral of Aachen, located in western Germany")
    end

    it "has a string representation" do

      expect(@site.to_s).to eq("The cultural site, Aachen, is located in Germany (Europe and North America region).")

    end

    it "has a summary" do

      expect(@site.summarise).to eq("Aachen (Germany): It is Emperor Charlemagne´s own Palatine Chapel, which constitutes the nucleus of the Cathedral of Aachen, located in western Germany.")

    end

  end

end

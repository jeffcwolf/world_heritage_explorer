require_relative 'site'

class Itinerary
  attr_reader :name, :description, :sites

  def initialize(name)
    @name = name
    @description = description
    @sites = []
  end

  def add_site(site)
    @sites << site
  end

  def remove_site(site)
    #Write code here to remove site object from array of sites
  end

  def generate_random_itinerary(size)
    #Write code to generate a random itinerary of specified size
    #i.e. a list of random sites, with a size and a name
  end

  def print_stats
    puts "\n*****"
    puts "Stats for the #{@name} Itinerary:"
    puts "Number of sites: #{@sites.size}"
    site_names
    # puts "Types of sites" -Where to process stats?
  end

  def print_itinerary(itinerary)
    #Write code to print a particular itinerary
  end

  def site_names
    sites.each do |site_object|
      puts site_object.name
    end
  end

end

if __FILE__ == $0

  site1 = Site.new("aachen Cathedral", "germany", "Europe and North America", "cultural", "It is Emperor Charlemagne´s own Palatine Chapel, which constitutes the nucleus of the Cathedral of Aachen, located in western Germany")
  site2 = Site.new("wadden sea", "germany", "Europe and North America", "natural")
  site3 = Site.new("masada", "israel", "Europe and North America", "natural", "Masada is a dramatically located site of great natural beauty overlooking the Dead Sea, a rugged natural fortress on which the Judaean king Herod the Great constructed a sumptuous palace complex in classical Roman style")

  it1 = Itinerary.new("Germany")

  it1.add_site(site1)
  it1.add_site(site2)
  it1.add_site(site3)

  it1.print_stats

end


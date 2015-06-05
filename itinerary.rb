require_relative 'site'

class Itinerary
  attr_reader :name, :description, :sites

  def initialize(name)
    @name = name
    @description = description
    @sites = []
  end

  def to_s
    "#{@name}: #{@sites}"
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
    site_listing
    # puts "Types of sites" -Where to process stats?
  end

  def print_itinerary(itinerary)
    #Write code to print a particular itinerary
  end

  def site_listing
    @sites.each { |s| puts s.name }
  end

end

if __FILE__ == $0


  it1 = Itinerary.new("Germany")

  it1.add_site(site1)
  it1.add_site(site2)
  it1.add_site(site3)

  it1.site_listing
  it1.print_stats


end


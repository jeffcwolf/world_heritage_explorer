require_relative 'searchable'
require_relative 'itinerary'

class Traveler
  include Searchable

  attr_accessor :name, :itineraries

  def initialize(name)
    @name = name
    @itineraries = Hash.new(0) #key-value should be name => array of site objects
  end

  def add_itinerary(itinerary)
    @itineraries[itinerary.name.to_sym] = itinerary.sites
  end

  # def remove_itinerary(itinerary)
  #   @itineraries.pop(itinerary)
  # end

  def to_s
    "#{@name}: #{@itineraries}"
  end

  def itinerary_listing
    @itineraries.each do |itinerary_name, sites_array|
      puts "#{itinerary_name}:"
      sites_array.each do |site_object|
        puts "#{site_object.name}"
      end
    end
  end

end

#Example Code

if __FILE__ == $0

  site1 = Site.new("aachen Cathedral", "germany", "Europe and North America", "cultural", "It is Emperor Charlemagne´s own Palatine Chapel, which constitutes the nucleus of the Cathedral of Aachen, located in western Germany")
  site2 = Site.new("wadden sea", "germany", "Europe and North America", "natural")
  site3 = Site.new("masada", "israel", "Europe and North America", "natural", "Masada is a dramatically located site of great natural beauty overlooking the Dead Sea, a rugged natural fortress on which the Judaean king Herod the Great constructed a sumptuous palace complex in classical Roman style")

  traveler1 = Traveler.new("Jane")

  it1 = Itinerary.new("Germany")
  it2 = Itinerary.new("North America")
  it3 = Itinerary.new("Central Europe")

  it1.add_site(site1)
  it1.add_site(site2)
  it2.add_site(site3)
  it3.add_site(site2)
  it3.add_site(site3)

  traveler1.add_itinerary(it1)
  traveler1.add_itinerary(it2)
  traveler1.add_itinerary(it3)

  puts "\n#{traveler1.name}'s Itineraries:"
  traveler1.itinerary_listing

end


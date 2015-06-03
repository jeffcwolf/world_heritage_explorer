require_relative 'itinerary'

class Traveler

  attr_accessor :name, :itineraries

  def initialize(name)
    @name = name
    @itineraries = {} #key-value should be name => array of site objects
  end

  def add_itinerary(itinerary)
    @itineraries.push(itinerary)
  end

  def itinerary_listing
    @itineraries.each do |itinerary|
      puts "#{itinerary.name} (#{itinerary.sites})"
    end
  end

  def print_itinerary(itinerary)
  end

  def random_itinerary
  end

end

#Example Code

if __FILE__ == $0

  traveler1 = Traveler.new("Jane")

  it1 = Itinerary.new("Germany")
  it2 = Itinerary.new("North America")
  it3 = Itinerary.new("Central Europe")

  p traveler1

  p traveler1.itineraries

  traveler1.add_itinerary(it1)
  traveler1.add_itinerary(it2)
  traveler1.add_itinerary(it3)

  puts "#{traveler1.name}'s Itineraries:"

  p traveler1.itineraries

  traveler1.itinerary_listing

end


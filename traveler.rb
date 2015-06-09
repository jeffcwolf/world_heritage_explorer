require_relative 'itinerary'

class Traveler

  attr_accessor :name, :itineraries

  def initialize(name)
    @name = name
    @itineraries = Hash.new(0) #key-value should be name => array of site objects
  end

  def to_s
    "#{@name}: #{@itineraries}"
  end

end

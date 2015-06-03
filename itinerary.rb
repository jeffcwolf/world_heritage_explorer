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
    @sites.pop(site)
  end

  def generate_random_itinerary
    #Write code to generate a random itinerary
    #i.e. a list of random sites, with a size and a name
  end

  def print_stats(itinerary)
    puts "\n#{itinerary}'s Stats:"

  end


end


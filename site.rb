class Site

  attr_reader :name, :country, :region, :type, :description
  attr_accessor :interest

  def initialize(name, country, region, type, description="", interest=0)
    @name = name.capitalize
    @country = country.capitalize
    @region = region
    @type = type
    @description = description
    @interest = interest
  end

  def to_s
    "The #{@type} site, #{@name}, is located in #{@country} (#{@region} region). My interest level is #{@interest} (out of 10)."
  end

  def summarise
    "#{@name} (#{@country}): #{@description}."
  end

  def high_interest?
    @interest >= 7 ? true : false
  end

  def itinerary_list
    #Write a method (using TDD) that prints out which itineraries
    #the site object belongs to
  end

end


#Example Code Workaround

# if __FILE__ == $0

#   #Example Code here

# end

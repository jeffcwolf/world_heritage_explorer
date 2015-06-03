class Site

  attr_reader :name, :country, :region, :type, :description

  def initialize(name, country, region, type, description="")
    @name = name.capitalize
    @country = country.capitalize
    @region = region
    @type = type
    @description = description
  end

  def to_s
    "The #{@type} site, #{@name}, is located in #{@country} (#{@region} region)."
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

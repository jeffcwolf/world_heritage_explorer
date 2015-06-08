class Site
  require 'Nokogiri'

  attr_accessor :name, :country, :region, :type, :description

  def initialize(name, country, region, type, description="")
    @name = name.capitalize
    @country = country.capitalize
    @region = region
    @type = type
    @description = description
  end

  def to_s
    "#{@name}, #{@country}, (#{@region}), #{@type}, '#{@description}'"
  end

  def summarise
    "#{@name} (#{@country}): #{@description}."
  end


  # def high_interest?
  #   @interest >= 7 ? true : false
  # end

  def itineraries_belongs_to
    #Write a method (using TDD) that prints out which itineraries
    #the site object belongs to
  end

end


#Example Code Workaround

if __FILE__ == $0

  site1 = Site.new("aachen Cathedral", "germany", "Europe and North America", "cultural", "It is Emperor Charlemagne´s own Palatine Chapel, which constitutes the nucleus of the Cathedral of Aachen, located in western Germany")

  site2 = Site.new("wadden sea", "germany", "Europe and North America", "natural")

  site3 = Site.new("masada", "israel", "Europe and North America", "natural", "Masada is a dramatically located site of great natural beauty overlooking the Dead Sea, a rugged natural fortress on which the Judaean king Herod the Great constructed a sumptuous palace complex in classical Roman style")

  # puts site1
  # p site2
  # p site3

  puts site1.summarise
  # puts site2.summarise
  # puts site3.summarise

end

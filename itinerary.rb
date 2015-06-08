require_relative 'site'

class Itinerary
  attr_accessor :name, :description, :sites
  attr_reader :xml_names, :xml_states, :xml_regions, :xml_categories, :xml_descriptions

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

  #SEARCH METHODS
  def site_search(answer)
    site_array = @sites.select { |value| value[0] == answer }
    site_array.each do |result|
      puts "\n******"
      puts result
    end
    puts "\n******"
    puts "#{site_array.size} Matching Sites"
    puts "******"
  end

  def country_search(answer)
    country_array = @sites.select { |value| value[1] == answer }
    country_array.each do |result|
      puts "\n******"
      puts result
    end
    puts "\n******"
    puts "#{country_array.size} Matching Sites"
    puts "******"
  end

  def region_search(answer)
    region_array = @sites.select { |value| value[2] == answer }
    region_array.each do |result|
      puts "\n******"
      puts result
    end
    puts "\n******"
    puts "#{region_array.size} Matching Sites"
    puts "******"
  end

  def category_search(answer)
    category_array = @sites.select { |value| value[3] == answer }
    category_array.each do |result|
      puts "\n******"
      puts result
    end
    puts "\n******"
    puts "#{category_array.size} Matching Sites"
    puts "******"
  end

  def description_search(answer)
    description_array = @sites.select { |value| value[4] =~ /#{answer}/ }
    description_array.each do |result|
      puts "\n******"
      puts result
    end
    puts "\n******"
    puts "#{description_array.size} Matching Sites"
    puts "******"
  end

  def load_data
    #Open XML File with Nokogiri

    f = File.open("world_heritage_list.xml")
    doc = Nokogiri::XML(f)

    #Save site names to an array

    @xml_names = []
    doc.xpath("/query/row/child::site").each do |node|
        @xml_names << node.text
      end

    #Save country names to an array

    @xml_states = []
    doc.xpath("/query/row/child::states").each do |node|
        @xml_states << node.text
      end

    #Save region names to an array

    @xml_regions = []
    doc.xpath("/query/row/child::region").each do |node|
      @xml_regions << node.text
    end

    #Save category names to an array

    @xml_categories = []
    doc.xpath("/query/row/child::category").each do |node|
      @xml_categories << node.text
    end

    #Save short descriptions to an array

    @xml_descriptions = []
    doc.xpath("/query/row/child::short_description").each do |node|
      @xml_descriptions << node.text
    end

    #Zip files to make useable arrays

    @sites = @xml_names.zip(@xml_states, @xml_regions, @xml_categories, @xml_descriptions)
    @site_values = @xml_states.zip(@xml_regions, @xml_categories, @xml_descriptions)

    #Create sites_hash instance variable

    @sites_hash = {}
    @sites_hash = Hash[@xml_names.zip(@site_values)]

    #Create Site Objects
    @sites_objects = []
    @sites.each do |s|
      @sites_objects << Site.new(s[0], s[1], s[2], s[3], s[4])
    end

    # Close file

    f.close

    #Exlicitly return value
    return @sites
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


require 'Nokogiri'
require 'yaml'

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

  def save_results
    puts "Would you like to save these search results to a file? Type 'y' for yes and 'n' for no."
    answer = gets.chomp.downcase
    case answer
    when 'y', 'yes'
      f = File.open('country_results.yml', 'w')
      YAML.dump(country_array)
      f.close
    end
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
    puts "\nWould you like to save these search results to a file? Type 'y' for yes or 'n' for no."
    answer = gets.chomp.downcase
    case answer
    when 'y', 'yes'
      file_name = "results_#{Time.now}"
      File.open(file_name, 'w') do |f|
        YAML.dump(country_array, f)
      end
      puts "File saved as '#{file_name}'"
    end
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

    # Close file

    f.close

    #Exlicitly return value
    return @sites
  end

  def find_random_site
    random_site = @sites[rand(0..1006)]
    puts "\nYour Random Site:"
    puts "\n******"
    puts random_site
    @random_itinerary << random_site
  end

  def random_itinerary(size)
    @random_itinerary = []
    size.times { find_random_site }
    puts "\n******"
    puts "Stats for your Random Itinerary:"
    puts "\******"
    puts "Number of Sites: #{size}"
    @random_itinerary.each do |result|
      puts "\n******"
      puts result
    end
  end

  def print_stats
    puts "\n*****"
    puts "Stats for the #{@name} Itinerary:"
    puts "Number of sites: #{@sites.size}"
    site_listing
    # puts "Types of sites" -Where to process stats?
  end

  def site_listing
    @sites.each { |s| puts s.name }
  end
end



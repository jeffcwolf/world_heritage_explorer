require_relative 'traveler'
require_relative 'itinerary'
require_relative 'searchable'

puts "Hi, what's your name, traveler?"
user_name = gets.chomp
user = Traveler.new(user_name)
@it_all = Itinerary.new("all")

puts "Loading World Heritage Sites data for you, #{user_name}..."

@it_all.load_data

puts "\nData has been loaded. Choose your search criteria below."

loop do

  puts "\n#{user_name.upcase}'s options (type 'quit' to exit):"
  puts "(1) Type '1' to search by site name. [Type '1_list' to print a list of ALL site names (#{@it_all.xml_names.uniq.size} total)]"
  puts "(2) Type '2' to search by country name. [Type '2_list' to print a list of ALL country names (#{@it_all.xml_states.uniq.size} total)]"
  puts "(3) Type '3' to search by region name. [Type '3_list' to print a list of ALL region names (#{@it_all.xml_regions.uniq.size} total)]"
  puts "(4) Type '4' to search by site category. [Type '4_list' to print a list of ALL category names (#{@it_all.xml_categories.uniq.size} total)"
  puts "(5) Type '5' to search the text of site descriptions"
  puts "(6) Type '6' to find a random site"
  puts "(7) Type '7' to generate a random itinerary (a collection of sites) of a chosen size (e.g. 10 random sites)"
  puts "(8) Type '8' to perform an advanced, multi-criteria search (e.g. find all cultural sites in Germany)"

  answer = gets.chomp.downcase

  case answer
  # when [include regex here]

  # Process print list commands
  when '1_list'
    puts @it_all.xml_names.uniq.sort
  when '2_list'
    puts @it_all.xml_states.uniq.sort
  when '3_list'
    puts @it_all.xml_regions.uniq.sort
  when '4_list'
    puts @it_all.xml_categories.uniq.sort

  # Process basic search commands
  when '1'
    puts "Type the site name you'd like to search for, e.g. Shiretoko:"
    site_answer = gets.chomp.capitalize
    @it_all.site_search(site_answer)
  when '2'
    puts "Type the country name you'd like to search for, e.g. Germany:"
    country_answer = gets.chomp.capitalize
    @it_all.country_search(country_answer)
  when '3'
    puts "Type the region name you'd like to search for, e.g. Arab States:"
    region_answer = gets.chomp.capitalize
    @it_all.region_search(region_answer)
  when '4'
    puts "Type the site category you'd like to search for, e.g. cultural:"
    category_answer = gets.chomp.capitalize
    @it_all.category_search(category_answer)
  when '5'
    puts "Type the description keyword you'd like to search for, e.g. capital:"
    description_answer = gets.chomp
    @it_all.description_search(description_answer)

  # Process other commands
  when '6'
    @it_all.find_random_site
  when '7'
    puts "How many random sites do you want in your itinerary (range is 1 to 1007)?"
    size_answer = gets.chomp.to_i
    @it_all.random_itinerary(size_answer)
  when '8'
    puts "Choose the criteria by which you want to build your search (country *or* region,  category, & description are the options). Note that search criteria must be typed in the following order, separated by commas and *without spaces* between commas: [country/region,category,description]. For example, search for cultural sites in Germany by typing 'Germany,cultural' or for natural sites in the Arab States with a keyword of 'rocks' by typing 'Arab States,natural,rocks'. Unused fields may be excluded:"
    multi_answer = []
    answer = gets.chomp
    multi_answer = answer.split(',')
    p multi_answer
    # geo_answer = gets.chomp.capitalize
    # cat_answer = gets.chomp.capitalize
    # desc_answer = gets.chomp

  #Process quit command
  when 'quit', 'q', 'exit'
    puts "See you again soon!"
    break
  else "Please enter an option number or type 'quit' to exit."
  end

end

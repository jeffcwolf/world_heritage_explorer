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

  #Process quit command
  when 'quit', 'q', 'exit'
    puts "See you again soon!"
    break
  else "Please enter an option number or type 'quit' to exit."
  end

end

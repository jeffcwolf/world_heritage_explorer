require_relative 'traveler'
require_relative 'searchable'

puts "Hi, what's your name, traveler?"
user_name = gets.chomp

user = Traveler.new(user_name)

puts "Loading World Heritage Sites data for you, #{user_name}..."

user.load_data

puts "\nData has been loaded. Choose your search criteria below (Type the number in parentheses to initiate search):"
puts "\n(1) Search by site name. Type '1_list' to print a list of ALL site names (#{@xml_names.size} total)"
puts "(2) Search by country name. Type '2_list' to print a list of ALL country names (#{@xml_states.size}"
puts "(3) Search by region name. Type '3_list' to print a list of ALL region names (#{@xml_regions.size}"
puts "(4) Search by site description"

answer = gets.chomp

# case answer

# when


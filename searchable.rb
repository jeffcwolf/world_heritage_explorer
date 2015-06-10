module Searchable
  require 'yaml'

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


end

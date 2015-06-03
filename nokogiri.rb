require 'Nokogiri'

f = File.open("world_heritage_list.xml")
doc = Nokogiri::XML(f)
regions = doc.xpath("//region")
states = doc.xpath("//states[text()='Germany']")
rows = doc.xpath("//*[text() = 'Germany']")

#Find elements where the states node = Germany and print the associated
# <short_description> and <category> and <http_url> and <location> and <region>

puts rows

f.close



require 'Nokogiri'

f = File.open("world_heritage_list.xml")
doc = Nokogiri::XML(f)
regions = doc.xpath("//region").text
germany = doc.xpath("/query/row/states[text()='Germany']")

doc.xpath("/query/row/short_description | /query/row/site | /query/row/states").each do |node|
      puts node.text
    end

site_names = doc.xpath("/query/row/site")

temp = doc.xpath("/query/row/short_description | /query/row/site | /query/row/states")

#Find elements where the states node = Germany and print the associated
# <short_description> and <category> and <http_url> and <location> and <region>
# of the <site>
# In order to do this, I need to learn a little bit of XPath syntax, so I can  traverse the XML tree


f.close



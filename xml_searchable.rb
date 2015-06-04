require 'Nokogiri'

module XmlSearchable

  #Write module methods here that encapsulate search queries into the XML
  #(name, country, region, type, description="")

  def create_site_objects
  end

    # site_1 = Site.new(xml_name, xml_country, xml_region, xml_type, xml_description)

end

#Example Code

#Open XML File with Nokogiri

f = File.open("world_heritage_list.xml")
doc = Nokogiri::XML(f)

#Save site names to an array

xml_names = []
doc.xpath("/query/row/site").each do |node|
    xml_names << node.text
  end

#Save country names to an array

country_names = []
doc.xpath("/query/row/states").each do |node|
    country_names << node.text
  end

#Try to save all the info in one go

site_names = []
doc.xpath("/query/row/site").each do |node|
  puts node.text.to_sym
end

site_values = []
doc.xpath("/query/row/site | /query/row/states | /query/row/region | /query/row/category | /query/row/short_description").each do |node|
  puts node.text
end

#I want to create

# Close file

f.close

puts site_values

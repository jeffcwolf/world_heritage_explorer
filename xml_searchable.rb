require 'Nokogiri'

module XmlSearchable

  #Write module methods here that encapsulate search queries into the XML
  #(name, country, region, type, description="")

  #CREATE SITES_HASH FROM XML FILE

  def load_hash

    #Open XML File with Nokogiri

    f = File.open("world_heritage_list.xml")
    doc = Nokogiri::XML(f)

    #Save site names to an array

    xml_names = []
    doc.xpath("/query/row/child::site").each do |node|
        xml_names << node.text.to_sym
      end

    #Save country names to an array

    xml_states = []
    doc.xpath("/query/row/child::states").each do |node|
        xml_states << node.text
      end

    #Save region names to an array

    xml_regions = []
    doc.xpath("/query/row/child::region").each do |node|
      xml_regions << node.text
    end

    #Save category names to an array

    xml_categories = []
    doc.xpath("/query/row/child::category").each do |node|
      xml_categories << node.text
    end

    #Save short descriptions to an array

    xml_descriptions = []
    doc.xpath("/query/row/child::short_description").each do |node|
      xml_descriptions << node.text
    end

    #Zip files to make useable array

    # test_zip = xml_names.zip(xml_states, xml_regions, xml_categories, xml_descriptions)
    site_values = xml_states.zip(xml_regions, xml_categories, xml_descriptions)

    #Create final sites_hash instance variable

    @sites_hash = {}
    @sites_hash = Hash[xml_names.zip(site_values)]

    # Close file

    f.close
  end

end




class XmlParser
  require 'Nokogiri'

  def self.load_data

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

    @sites_array = @xml_names.zip(@xml_states, @xml_regions, @xml_categories, @xml_descriptions)
    @site_values = @xml_states.zip(@xml_regions, @xml_categories, @xml_descriptions)

    #Create sites_hash instance variable

    @sites_hash = {}
    @sites_hash = Hash[@xml_names.zip(@site_values)]

    #Create Site Objects
    @sites_objects = []
    @sites_array.each do |s|
      @sites_objects << Site.new(s[0], s[1], s[2], s[3], s[4])
    end

    # Close file

    f.close

    # Provide explicit return value
    return @sites_array
  end

end

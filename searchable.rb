

module Searchable
  require 'Nokogiri'
  require_relative 'site'

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

  #SEARCH METHODS
  #Assume I get the user search value from @answer

  #Search by Attribute (name, country, region, category)
  def site_name_search(answer)
    @sites_array.select { |value| value[0] == answer }
    # @sites_hash.fetch(answer)
  end

  def country_search(answer)
    @sites_array.select { |value| value[1] == answer }
    # @sites_hash.values.select { |value| value[0] == answer }
  end

  def region_search(answer)
    @sites_array.select { |value| value[2] == answer }
    # @sites_hash.values.select { |value| value[1] == answer }
  end

  def category_search(answer)
    @sites_array.select { |value| value[3] == answer }
    # @sites_hash.values.select { |value| value[2] == answer }
  end

  def description_search(answer)
    @sites_array.select { |value| value[4] =~ /#{answer}/ }
    # @sites_hash.values.select { |value| value[3] =~ /#{answer}/ }
  end

  def everything_search(answer)
  end

end

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














require 'Nokogiri'
require_relative 'searchable'

class Itinerary
  include Searchable

  attr_accessor :name, :sites
  attr_reader :xml_names, :xml_states, :xml_regions, :xml_categories, :xml_descriptions

  def initialize(name)
    @name = name
    @sites = []
  end

  def to_s
    "#{@name}: #{@sites}"
  end

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

    @sites = @xml_names.zip(@xml_states, @xml_regions, @xml_categories, @xml_descriptions)
    @site_values = @xml_states.zip(@xml_regions, @xml_categories, @xml_descriptions)

    # Close file

    f.close

    #Exlicitly return value
    return @sites
  end
end



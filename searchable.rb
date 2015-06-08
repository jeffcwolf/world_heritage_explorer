module Searchable
  require_relative 'site'

  #Search by Attribute (name, country, region, category)
  def site_name_search(answer)
    return @sites_array.select { |value| value[0] == answer }
    # @sites_hash.fetch(answer)
  end

  def country_search(answer)
    return @sites_array.select { |value| value[1] == answer }
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
end

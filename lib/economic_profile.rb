require 'pry'                           # => true, false
require 'csv'                           # => true, false
require_relative 'district_repository'  # => false, true
require_relative 'districts'            # => false, false
require_relative 'file_names'           # => true, false

class EconomicProfile
  attr_reader :data    # => nil, nil

  def initialize(districts, data)
    @districts = districts
    @data = data
  end                              # => :initialize, :initialize

  def free_or_reduced_lunch_in_year(year)
    timeframe  = data.select{|row| row.fetch(:timeframe) == year.to_s && row.fetch(:poverty_level) == "Eligible for Free or Reduced Lunch"}
    timeframe.find {|thing| thing.fetch(:data) == data}
    dataformat = timeframe.select {|row| row.fetch(:dataformat) == "Percent"}
    data = dataformat.map {|hashes| hashes.fetch(:data)}
    data[0].to_f.round(3)
    # binding.pry
  end                                                                          # => :free_or_reduced_lunch_in_year, :free_or_reduced_lunch_in_year

end  # => :free_or_reduced_lunch_in_year, :free_or_reduced_lunch_in_year

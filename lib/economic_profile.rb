require 'pry'
require 'csv'
require_relative 'district_repository'
require_relative 'districts'
require_relative 'file_names'

class EconomicProfile
  attr_reader :data

  def initialize(districts, data)
    @districts = districts
    @data = data
  end

  def free_or_reduced_lunch_in_year(year)
    timeframe  = data.select{|row| row.fetch(:timeframe) == year.to_s && row.fetch(:poverty_level) == "Eligible for Free or Reduced Lunch"}
    # timeframe.find {|thing| thing.fetch(:data) == data}
    dataformat = timeframe.select {|row| row.fetch(:dataformat) == "Percent"}
    data = dataformat.map {|hashes| hashes.fetch(:data)}
    data[0].to_f.round(3)
    # binding.pry
  end

  def free_or_reduced_lunch_by_year
    timeframe  = data.select{|row| row.fetch(:timeframe) == year.to_s && row.fetch(:poverty_level) == "Eligible for Free or Reduced Lunch"}
    # timeframe.find {|thing| thing.fetch(:data) == data}
    dataformat = timeframe.select {|row| row.fetch(:dataformat) == "Percent"}
    data = dataformat.map {|hashes| hashes.fetch(:data)}
    binding.pry
  end

  def school_aged_children_in_poverty_in_year(year)
    timeframe  = data.select{|row| row.fetch(:timeframe) == year.to_s && row.fetch(:dataformat) == "Percent"}
    # timeframe.find {|thing| thing.fetch(:data) == data}
    dataformat = timeframe.select {|row| row.fetch(:dataformat) == "Percent"}
    data = dataformat.map {|hashes| hashes.fetch(:data)}
    data[0].to_f.round(3)
    # binding.pry
  end
end

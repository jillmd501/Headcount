require 'csv'
require_relative 'district_repository'
require_relative 'districts'

class EconomicProfile
  attr_reader :data

  def initialize(districts)
    @districts = districts
  end

  def parse_method_file(filename)
    @parsed ||= Parse.new(@district_name, filename).parse_runner
  end

  def free_or_reduced_lunch_by_year(year)
    file = "Students qualifying for free or reduced price lunch.csv"
    parsed = Parse.new(@districts, file).parser
    data = {}
    parsed.each do |row|
      if row.fetch(:poverty_level) == "Eligible for Free or Reduced Lunch" && row.fetch(:dataformat) == "Percent"
        data[row.fetch(:timeframe).to_i] = row[:data].to_s[0..4].to_f
      end
    end
    data
  end

  def free_or_reduced_lunch_in_year(year)
    if free_or_reduced_lunch_by_year[year]
      free_or_reduced_lunch_by_year.fetch(year)
    else
      nil
    end
  end

  def school_aged_children_in_poverty_by_year
    file = "School aged children in poverty by year.csv"
    parsed = Parse.new(@districts, file).parser
    data = {}
    parsed.each do |row|"School aged children in poverty by year" && row.fetch(:dataformat) == "Percent"
        data[row.fetch(:timeframe).to_i] = row[:data].to_s[0..4].to_f
      end
    end
    data
  end

  def school_aged_children_in_poverty_by_year(year)
    if school_aged_children_in_poverty_by_year[year]
      school_aged_children_in_poverty_by_year.fetch(year)
    else
      nil
    end
  end
end

require 'pry'
require 'csv'
require_relative 'district_repository'
require_relative 'districts'
require_relative 'file_names'

class EconomicProfile
  attr_reader :data

  def truncate(percentage)
  (percentage.to_f * 1000).to_i / 1000.0
  end

  def initialize(districts, data)
    @districts = districts
    @data = data
  end

  def free_or_reduced_lunch_by_year
    data.select { |row| row[:dataformat] == 'Percent' && row[:poverty_level] == 'Eligible for Free or Reduced Lunch' }
        .map { |row| [row[:timeframe].to_i, truncate(row[:data])] }
        .to_h
  end

  def free_or_reduced_lunch_in_year(year)
    if free_or_reduced_lunch_by_year[year]
      free_or_reduced_lunch_by_year.fetch(year)
    else
      nil
    end
  end

  def school_aged_children_in_poverty_in_year(year)
    data.select { |row| row[:dataformat] == 'Percent' }
        .map { |row| [row[:timeframe], truncate(row[:data])] }
        .to_h[year.to_s]
      # binding.pry
  end

  def free_or_reduced_lunch_in_year(year)
    if free_or_reduced_lunch_by_year[year]
      free_or_reduced_lunch_by_year.fetch(year)
    else
      nil
    end
  end

  def title_1_students_in_year(year)
    data.select { |row| row[:dataformat] == 'Percent' }
        .map { |row| [row[:timeframe], truncate(row[:data])] }
        .to_h[year.to_s]
      # binding.pry
  end

end

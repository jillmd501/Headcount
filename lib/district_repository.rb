require_relative 'districts'
require 'csv'

class DistrictRepository

  def initialize(districts)
    @districts = []
  end

  def free_and_reduced_lunch_time_and_data
  end

  def self.from_csv(path)
    file_name = CSV.read "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
    columns = file_name.split(",")
    @districts << columns[0]

    p districts
  end

  def find_by_name(name)
    Districts.new(district)
  end

end

hello = DistrictRepository.new(@districts)

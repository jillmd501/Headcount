require_relative 'districts'
require 'csv'

class DistrictRepository
  def initialize(districts)
    @districts = {}
  end

  # def self.from_csv(path)
  #   file_name = File.readlines "Students qualifying for free or reduced price lunch"
  #   districts = {}
  #   file_name.each do |row|
  #     columns = file_name.split(",")
  #     districts << column[0]
  #   end
  #   DistrictRepository.new(districts)
  # end

  def self.from_csv(path)
    file_name = CSV.read "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
    columns = file_name.split(",")
    @districts << columns[0]
    p districts
  end

  def student_qualify_free_lunch_time_and_data
    districts = {}
    DistrictRepository.new(districts)
    contents = CSV.open "Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
      contents.each do |row|
      timeframe = row[:TimeFrame]
      data = row[:Data]
    end
  end

  def find_by_name(name)
    Districts.new(district)
  end
end

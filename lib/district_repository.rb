require_relative 'districts'  # => true
require 'csv'                 # => true

class DistrictRepository
  def initialize(districts)
    @districts = districts
  end                        # => :initialize

  def self.from_csv(path)
    rows = CSV.read "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
    districts = rows.map {|district| district.to_h}
    repository = DistrictRepository.new(districts)
    # require 'pry';binding.pry
  end                                                                                                                                                           # => :from_csv

  def student_qualify_free_lunch_time_and_data
    districts = {}
    DistrictRepository.new(districts)
    contents = CSV.open "Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
      contents.each do |row|
      timeframe = row[:TimeFrame]
      data = row[:Data]
    end
  end                                                                                                                         # => :student_qualify_free_lunch_time_and_data

  def find_by_name(name)
    

  end                          # => :find_by_name
end                            # => :find_by_name

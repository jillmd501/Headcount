require 'csv'
require_relative 'district_repository'
require_relative 'districts'

class EconomicProfile
  attr_reader :data

  def initialize(districts)
    @districts = districts
  end

  def free_or_reduced_lunch_in_year(year)
    rows = CSV.open "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
    # row_hash = rows.map {|row| row.to_h}
    data = []
    year = []
    districts = rows.map {|district| district.to_h}
    districts.each_with_index do |index, value|
       data << index[:data][0..index.length]
       year << index[:timeframe][0..index.length]
     end
     districts.each_with_index do |district|
       location = district.extract!(:location, :x)
     end
    #  jill = Hash[year.zip(data)]
    # require 'pry';binding.pry
  end

end

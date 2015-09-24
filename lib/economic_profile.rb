require 'csv'
require_relative 'districts'

class EconomicProfile
  attr_reader :data

  def initialize(districts)
    @districts = districts
  end

  def free_or_reduced_lunch_in_year(year)
    rows = CSV.read "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
    data = []
    year = []
    districts = rows.map {|district| district.to_h}
    districts.each_with_index do |index, value|
       data << index[:data][0..index.length]
       year << index[:timeframe][0..index.length] if whatever[:dataformat] = "percent"
       
       end
    jill = Hash[year.zip(data)]

  end

end

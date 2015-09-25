require 'csv'
require_relative 'district_repository'
require_relative 'districts'

class EconomicProfile
  attr_reader :data

  def initialize(districts)
    @districts = districts

  end

  def free_or_reduced_lunch_in_year(year)
    file = "Students qualifying for free or reduced price lunch.csv"
    parsed = Parse.new(@districts, file).parser
    data = {}
    parsed.each do |row|
      if row.fetch(:dataformat) == "Percent"
        data = row(:data)
      end
    end
    require 'pry'; binding.pry
    # @rows = CSV.open "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
    # row_hash = rows.map {|row| row.to_h}
    #
    # require 'pry';binding.pry
    # districts = row_hash.select {|district| district.to_h[:timeframe] == year}
  end

end

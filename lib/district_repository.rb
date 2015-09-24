require_relative 'districts'
require_relative 'economic_profile'
require 'csv'
require_relative 'parse'

class DistrictRepository
  attr_reader :districts

  def initialize(districts)
    @districts  = districts
    @final_repository = final_repository
  end

  def self.from_csv(path)
   @final_repository = {}
   rows = CSV.read "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
   districts = rows.map {|district| district.to_h}
   districts.each do |row|
     if !@final_repository.include?(row[:location])
        @final_repository[row[:location]] = Districts.new(row[:location])
      end
    end
    self
   end

  def self.find_by_name(name)
    name = @final_repository.fetch(name)
    name
  end

  def find_by_all
  end
end

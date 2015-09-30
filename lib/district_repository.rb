require_relative 'districts'
require_relative 'economic_profile'
require 'csv'
require_relative 'parse'
require 'pry'

class DistrictRepository
  attr_reader :districts

  def initialize(districts)
    @districts  = districts
    @final_repository = final_repository
  end

  def self.from_csv(path)
   @final_repository = {}

   rows = CSV.read "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
  #  binding.pry
   districts = rows.map {|district| district.to_h}
   districts.each do |row|
     if !@final_repository.include?(row[:location])
        @final_repository[row[:location].upcase] = Districts.new(row[:location])
      end
    end
    self
   end

  def self.find_by_name(name)
    if @final_repository.has_key?(name.upcase)
    name = @final_repository.fetch(name.upcase)
    name
  else nil
    end
  end

  def self.find_all_matching(name_fragment)
    result_array = []
    @final_repository.each do |word|
      if word[0].include?(name_fragment.upcase)
      result_array << word[1]
      end
    end
    result_array
  end

end

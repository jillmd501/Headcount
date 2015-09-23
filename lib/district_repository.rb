require_relative 'districts'

require 'csv'

class DistrictRepository
  attr_reader :districts, :name

  def initialize(districts)
    @districts  = districts
  end

  def self.from_csv(path)
   final_repository = {}
   rows = CSV.read "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
   districts = rows.map {|district| district.to_h}
   districts.each do |row|
     if !final_repository.include?(row[:location])
        final_repository[row[:location]] = Districts.new(row)
      end
    end
    final_repository

   end

  def find_by_name(name)
    name = final_repository.fetch(name).to_s
    name
  end

  def find_by_all
  end
end

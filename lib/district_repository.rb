require_relative 'districts'  # => true

require 'csv'  # => true

class DistrictRepository
 attr_reader :districts   # => nil

 def initialize(districts)
   @districts  = districts
 end                        # => :initialize

 def self.from_csv(path)
   final_repository = {}
   rows = CSV.read "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
   districts = rows.map {|district| district.to_h}
   districts.each do |row|
     if !final_repository.include?[row[:location]]
        final_repository[row[:location]] = Districts.new
      end
    end
    final_repository
 end                                                                                                                                                           # => :from_csv

 def find_by_name(district)
   districts
 end                     # => :find_by_name

 def find_by_all
 end              # => :find_by_all

end  # => :find_by_all

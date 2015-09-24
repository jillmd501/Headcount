require 'csv'
require 'pry'
require_relative 'districts'

class Parse

  def initialize(district_name, file)
    # initialize variables
    @district_name = district_name
    @file          = "Students qualifying for free or reduced price lunch.csv"
  end

  def parser
    @row   = row_creating_method
    @hash  = hash_creating_method
  end

  def row_creating_method
    # Creates filepath to open up file (in order to extract data later)
    path = File.expand_path("../data", __dir__)
    fullpath = File.join(path, @file)
    CSV.read(fullpath, headers: true, header_converters: :symbol)
    #  binding.pry
  end

  def hash_creating_method
    final_rows = @row.map{|array| array.to_h}
    final_rows.select{|row| row.fetch(:location) == @district_name}
  end

end

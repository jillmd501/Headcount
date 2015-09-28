require 'csv'
require 'pry'
require_relative 'districts'

class Parse

  def initialize(district_name, file, data_hash={})
    # initialize variables
    @district_name = district_name
    @file          = file
    @data_hash     = hash
  end

  def parser
    open_row    = open_data_by_row
    create_hash = create_hash_of_data
  end

  def open_data_by_row
    # Creates filepath to open up file (in order to extract data later)
    path = File.expand_path("../data", __dir__)
    fullpath = File.join(path, @file)
    CSV.read(fullpath, headers: true, header_converters: :symbol)
    #  binding.pry
  end

  def create_hash_of_data(row)
    final_rows = rows.map{|array| array.to_h}
  end

end

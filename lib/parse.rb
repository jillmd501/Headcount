require 'csv'
require 'pry'
require_relative 'districts'

class Parse

  def initialize(district_name)
    @district_name = district_name

  end

  def load(file)
    @row   = row_creating_method(file)
    @hash  = hash_creating_method(file)
  end

  def row_creating_method(file)
    fullpath = File.join("../data", file)
    path = File.expand_path(fullpath, __dir__)
    CSV.read path, headers: true, header_converters: :symbol
  end

  def hash_creating_method(file)
    final_rows = @row.map {|row| row.to_h}
    final_rows.select{|row| row.fetch(:location) == @district_name}
  end

  def load_economic_profile
    # iterate through an array of files
    file = "Students qualifying for free or reduced price lunch.csv"
    load(file)
  end

  def load_enrollment
  end

  def load_statewide_testing
  end

end

require 'csv'
require 'pry'
require_relative 'districts'
require_relative 'file_names'

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
    final_rows.each.select{|row| row.fetch(:location) == @district_name.downcase.capitalize}

  end

  def load_economic_profile
    @data = {}
    @data[:median_household_income] = load(FileNames.file_median_income)
    @data[:lunches] = load(FileNames.file_lunches)
    # / binding.pry
  end

  def load_enrollment
  end

  def load_statewide_testing
  end

end

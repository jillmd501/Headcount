require 'csv'
require 'pry'

class Parse

  def initialize(contents)
    @contents = contents
  end
    # binding.pry

  def parse_csv_file
    contents = CSV.open "/Users/marlomajor/code/headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
    contents.each do |row|
      year = row|:TimeFrame|
      data = row|:Data|
      File.join(data_dir, file)
      path = File.expand_path("../data", __dir__)
    end
  end

end

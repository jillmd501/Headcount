require 'csv'

def parse_csv_file
  file_name = File.readlines "Students qualifying for free or reduced price lunch"
  districts = {}
  file_name.each do |key, file|
    File.join(data_dir, file)
    path = File.expand_path("../data", __dir__)
    file_path = CSV.read "Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol
end

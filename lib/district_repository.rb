require_relative 'district'
require 'json'
require 'pry'

class DistrictRepository
  def self.from_json(path)
    data = JSON.parse(File.read(path))
    DistrictRepository.new(data)
    end

  attr_reader :districts

  # final_repository is a hash
  #   keys are district names
  #   values are hashes of district data
  def initialize(final_repository)
    @final_repository = final_repository.map {|name, data| [name, District.new(data)]}.to_h
  end

  def find_by_name(name)
    downcase_name = name.downcase
    if @final_repository[downcase_name].nil?
      nil
    else
      @final_repository.fetch(downcase_name)
    end
  end

  def find_all_matching(name_fragment)
    result_array = []
    @final_repository.each do |word|
      if word[0].include?(name_fragment.downcase)
      result_array << word[1]
      end
    end
    result_array
  end

end

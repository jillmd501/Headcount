require_relative 'district'
require 'pry'

class DistrictRepository
  def self.from_json(path)
    require "pry"
    binding.pry
    DistrictRepository.new(districts_data)
  end

  attr_reader :districts

  # final_repository is a hash
  #   keys are district names
  #   values are hashes of district data
  def initialize(final_repository)
    @final_repository = final_repository
  end

  def find_by_name(name)
    if @final_repository.has_key?(name.upcase)
      @final_repository.fetch(name.upcase)
    else
      nil
    end
  end

  def find_all_matching(name_fragment)
    result_array = []
    @final_repository.each do |word|
      if word[0].include?(name_fragment.upcase)
      result_array << word[1]
      end
    end
    result_array
  end

end

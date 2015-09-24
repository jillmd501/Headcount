gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
# require './lib/economic_profile'
require './lib/district_repository'
require './lib/districts'
require './lib/parse'
require 'csv'

class TestEconomicProfile < Minitest::Test
  def test_free_or_reduced_lunch_in_year
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ACADEMY 20")
    # require 'pry';binding.pry
    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end
end

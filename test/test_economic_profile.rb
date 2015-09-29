gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/economic_profile'
require './lib/district_repository'
require './lib/districts'
require './lib/parse'
require 'csv'

class TestEconomicProfile < Minitest::Test
  def test_it_exists
    assert DistrictRepository
  end

  def test_free_or_reduced_lunch_in_year
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ACADEMY 20")
    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end

  def test_free_or_reduced_lunch_for_different_district
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ASPEN 1")
    assert_equal 0.066, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end

  def test_school_aged_children_in_poverty_by_year
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ACADEMY 20")
    assert_equal 0.064, district.economic_profile.school_aged_children_in_poverty_in_year(2012)
  end

end

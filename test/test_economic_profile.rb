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

    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end

  def test_free_or_reduced_lunch_in_year_in_other_district
    path = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district = repository.find_by_name("FALCON 49")

    assert_equal 0.153, district.economic_profile.free_or_reduced_lunch_in_year(2004)
  end

  # def test_different_year_for_reduced_lunch_returns_nil
  #   path = File.expand_path("../data", __dir__)
  #   repository = DistrictRepository.from_csv(path)
  #   district = repository.find_by_name("ALAMOSA RE-11J")
  #
  #   assert_equal nil, district.economic_profile.free_or_reduced_lunch_in_year(2040)
  # end

  def school_aged_children_in_poverty_by_year
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ACADEMY 20")

    assert_equal 0.034, district.economic_profile.free_or_reduced_lunch_in_year(2004)
  end

  def school_aged_children_in_poverty_by_year_in_other_district
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("CHERAW 31")

    assert_equal 0.185, district.economic_profile.free_or_reduced_lunch_in_year(2003)
  end
end

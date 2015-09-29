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
    skip
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ACADEMY 20")
    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end

  def test_free_or_reduced_lunch_for_different_district
    skip
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ASPEN 1")
    assert_equal 0.066, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end

  def test_school_aged_children_in_poverty_by_year
    skip
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ACADEMY 20")
    assert_equal 0.064, district.economic_profile.school_aged_children_in_poverty_in_year(2012)
  end

  def test_school_aged_children_in_poverty_by_year_in_different
    skip
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ALAMOSA RE-11J")
    assert_equal 0.304, district.economic_profile.school_aged_children_in_poverty_in_year(2011)
  end

  def test_median_income_by_years

    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("Colorado")
    assert_equal 56222, district.economic_profile.median_income_by_years(2005-2009)
  end

  def test_median_income_by_years_in_different_district
    skip
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("VILAS RE-5")
    assert_equal 26250, district.economic_profile.median_income_by_years(2006-2010)
  end

  def test_title_1_by_year
    skip
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("AGATE 300")
    assert_equal 0.6, district.economic_profile.title_1_students_in_year(2012)
  end

  def test_title_1_by_year_in_different_district
    skip
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    district   = repository.find_by_name("ADAMS COUNTY 14")
    assert_equal 0.669, district.economic_profile.title_1_students_in_year(2009)
  end

end

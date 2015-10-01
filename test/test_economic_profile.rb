require 'headcount'

class TestEconomicProfile < Minitest::Test
  def repository
    path = File.expand_path("../data/districts.json", __dir__)
    @repository ||= DistrictRepository.from_json(path)
  end

  def test_it_exists
    assert DistrictRepository
  end

  def test_free_or_reduced_lunch_in_year
    district = repository.find_by_name("ACADEMY 20")
    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end

  def test_free_or_reduced_lunch_for_different_district
    district = repository.find_by_name("ASPEN 1")
    assert_equal 0.066, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end

  def test_school_aged_children_in_poverty_by_year
    district = repository.find_by_name("ACADEMY 20")
    assert_equal 0.064, district.economic_profile.school_aged_children_in_poverty_in_year(2012)
  end

  def test_school_aged_children_in_poverty_by_year_in_different
    district = repository.find_by_name("ALAMOSA RE-11J")
    assert_equal 0.304, district.economic_profile.school_aged_children_in_poverty_in_year(2011)
  end

  def test_title_1_by_year
    district = repository.find_by_name("AGATE 300")
    assert_equal 0.6, district.economic_profile.title_1_students_in_year(2012)
  end

  def test_title_1_by_year_in_different_district
    district = repository.find_by_name("ADAMS COUNTY 14")
    assert_equal 0.669, district.economic_profile.title_1_students_in_year(2009)
  end
end

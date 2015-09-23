gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
# require './lib/economic_profile'
require './lib/district_repository'
require './lib/districts'
require './lib/parse'

class TestEconomicProfile < Minitest::Test
  def test_free_or_reduced_lunch_in_year
    path       = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    # require 'pry';binding.pry
    district   = repository.find_by_name("ACADEMY 20")

    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end

#   # def test_school_aged_children_in_poverty_in_year
#     skip
#   end
#
#   def test_title_1_students_by_year
#     skip
#   end
end

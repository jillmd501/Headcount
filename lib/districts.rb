require_relative 'economic_profile'
require_relative 'district_repository'
require_relative 'parse'

class Districts
  attr_accessor :name

  def initialize(name)
    @name = name.upcase
  end

  def economic_profile
    data = Parse.new(@name).load_economic_profile
    EconomicProfile.new(name, data)
  end

  def statewide_testing
    StatewideTesting.new(name)
  end

  def enrollment
    Enrollment.new(name)
  end

end

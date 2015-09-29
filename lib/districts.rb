require_relative 'economic_profile'
require_relative 'district_repository'

class Districts
  attr_accessor :name

  def initialize(name)
    @name = name.upcase
  end

  def economic_profile
    econ = EconomicProfile.new(name, data)
  end

  def statewide_testing
    state = StatewideTesting.new(name, data)
  end

  def enrollment
    enroll = Enrollment.new(name, data)
  end

end

require_relative 'economic_profile'
require_relative 'district_repository'

class Districts
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def economic_profile
    econ = EconomicProfile.new(name)
  end

  def statewide_testing
    state = StatewideTesting.new(name)
  end

  def enrollment
    enroll = Enrollment.new(name)
  end
  
end

require_relative 'economic_profile'
require_relative 'statewide_testing'
require_relative 'enrollment'

class District
  attr_accessor :name

  # district_data is a hash
  #   keys are things it needs, in order to be a district
  def initialize(district_data)
    @name = district_data.fetch :name
    @district_data = district_data
  end

  def economic_profile
    EconomicProfile.new(district_data.fetch(:economic_profile))
  end

  def statewide_testing
    StatewideTesting.new() # <-- pass the data here, too
  end

  def enrollment
    Enrollment.new() # <-- pass the data here, too
  end
end

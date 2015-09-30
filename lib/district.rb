require_relative 'economic_profile'
require_relative 'statewide_testing'
require_relative 'enrollment'
require 'pry'

class District
  attr_accessor :name

  # district_data is a hash
  #   keys are things it needs, in order to be a district
  def initialize(district_data)
    @district_data = district_data.map { |key, value| [key.to_sym, value] }.to_h
    @name = district_data.fetch("name")
  end

  def economic_profile
    EconomicProfile.new(@district_data.fetch(:economic_profile))
  end

  def statewide_testing
    StatewideTesting.new(@district_data.fetch(:statewide_testing))
  end

  def enrollment
    Enrollment.new(@district_data.fetch(:enrollment))
  end
end

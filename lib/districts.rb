require_relative 'economic_profile'
require_relative 'district_repository'

class Districts

  def initialize(name)
    @name = name

  end

  def economic_profile
    local_var = EconomicProfile.new(@name)
  end

end

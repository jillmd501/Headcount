class Districts
  # attr_reader :location,
  #             :poverty_level,
  #             :timeframe,
  #             :data_format,
  #             :data

  def initialize(row)
    # @location = location
    # @poverty_level = poverty_level
    # @timeframe = timeframe
    # @data_format = data_format
    # @data = data
  end

  def economic_profile(name)
    EconomicProfile.new()
  end

  def district
    14234
  end
end

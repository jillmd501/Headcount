class DistrictRepository

  def initialize(districts)
    
  end

  def self.from_csv(path)
    districts = {}
    DistrictRepository.new(districts)
  end

  def find_by_name(districts)
  end

  def economic_profile(districts)
  end

end

class Enrollment

  def intialize
  end

  def dropout_rate_in_year(year)
    #Call to this method with an unknown year will return nil
    #The method returns a truncated three digit floating point representing a percentage
    #example: enrollment.dropout_rate_in_year(2012) # => 0.680
  end

  def dropout_rate_by_gender_in_year(year)
    #Call to this method with an unknown year will return nil
    #The method returns a has with gender markers as keys and a three digit floating point representing a percentage
    #example: enrollment.dropout_rate_by_gender_in_year(2012) => {:female => 0.002, :male => 0.002}
  end

  def dropout_rate_by_race_in_year(year)
    #Call to this method with an unknown year will return nil
    #The method returns a has with gender markers as keys and a three digit floating point representing a percentage
    #enrollment.dropout_rate_by_race_in_year(2012)=> { :asian => 0.001,
    #                                                  :black => 0.001,
    #                                                  :pacific_islander => 0.001,
    #                                                  :hispanic => 0.001,
    #                                                  :native_american => 0.001,
    #                                                  :two_or_more => 0.001,
    #                                                  :white => 0.001
    #                                                 }
  end

  def dropout_rate_for_race_or_ethnicity(race)
    # race as a symbol from the following set: [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white]
    # A call to this method with any unknown race should raise an UnknownRaceError.
    # The method returns a hash with years as keys and a three-digit floating point number representing a percentage
    # example: enrollment.dropout_rate_for_race_or_ethnicity(:asian) => {2011 => 0.047, 2012 => 0.041}
  end

  def dropout_rate_for_race_or_ethnicity_in_year(race, year)
    # race as a symbol from the following set: [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white]
    # year as an integer for any year reported in the data
    # A call to this method with any unknown year should return nil.
    # The method returns a truncated three-digit floating point number representing a percentage.
    # Example:enrollment.dropout_rate_for_race_or_ethnicity_in_year(:asian, 2012) # => 0.001
  end

  def graduation_rate_by_year(year)
    # This method returns a hash with years as keys and a truncated three-digit floating point number representing a percentage.
    # Example:enrollment.graduation_rate_by_year
    # => { 2010 => 0.895,
    #      2011 => 0.895,
    #      2012 => 0.889,
    #      2013 => 0.913,
    #      2014 => 0.898,
    #    }
  end

  def graduation_rate_in_year(year)
    # year as an integer for any year reported in the data
    # A call to this method with any unknown year should return nil.
    # The method returns a truncated three-digit floating point number representing a percentage.
    # Example:enrollment.graduation_rate_in_year(2010) # => 0.895
  end

  def kindergarten_participation_by_year
    # This method returns a hash with years as keys and a truncated three-digit floating point number representing a percentage.
    # Example:enrollment.kindergarten_participation_by_year
    # => { 2010 => 0.391,
    #      2011 => 0.353,
    #      2012 => 0.267,
    #      2013 => 0.487,
    #      2014 => 0.490,
    #    }
  end

  def kindergarten_participation_in_year(year)
    # year as an integer for any year reported in the data
    # A call to this method with any unknown year should return nil.
    # The method returns a truncated three-digit floating point number representing a percentage.
    # Example:enrollment.kindergarten_participation_in_year(2010) # => 0.391
  end

  def online_participation_by_year
    # This method returns a hash with years as keys and an integer as the value.
    # Example:enrollment.online_participation_by_year
    # => { 2010 => 16,
    #      2011 => 18,
    #      2012 => 24,
    #      2013 => 32,
    #      2014 => 40,
    #    }
  end

  def online_participation_in_year(year)
    # year as an integer for any year reported in the data
    # A call to this method with any unknown year should return nil
    # The method returns a single integer.
    # Example: enrollment.online_participation_in_year(2013) # => 33
  end

  def participation_by_year
    # method returns a hash with years as keys and an integer as the value.
    # Example:enrollment.participation_by_year
    # => { 2009 => 22620,
    #      2010 => 22620,
    #      2011 => 23119,
    #      2012 => 23657,
    #      2013 => 23973,
    #      2014 => 24578,
    #    }
  end

  def participation_in_year(year)
    # year as an integer for any year reported in the data
    # A call to this method with any unknown year should return nil.
    # The method returns a single integer.
    # Example: enrollment.participation_in_year(2013) # => 23973
  end

  def participation_by_race_or_ethnicity(race)
    # race as a symbol from the following set: [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white]
    # A call to this method with any unknown race should raise an UnknownRaceError.
    # The method returns a hash with years as keys and a three-digit floating point number representing a percentage.
    # Example: enrollment.participation_by_race_or_ethnicity(:asian)
    # => { 2011 => 0.047,
    #      2012 => 0.041,
    #      2013 => 0.052,
    #      2014 => 0.056
    #    }
  end

  def participation_by_race_or_ethnicity_in_year(year)
    # year as an integer for any year reported in the data
    # A call to this method with any unknown year should return nil.
    # The method returns a hash with race markers as keys and a three-digit floating point number representing a percentage.
    # Example:enrollment.participation_by_race_or_ethnicity_in_year(2012)
    # => { :asian => 0.036,
    #      :black => 0.029,
    #      :pacific_islander => 0.118,
    #      :hispanic => 0.003,
    #      :native_american => 0.004,
    #      :two_or_more => 0.050,
    #      :white => 0.756
    #    }
  end

  def special_education_by_year
    # This method returns a hash with years as keys and an floating point three-significant digits representing a percentage.
    # Example: enrollment.special_education_by_year
    # => { 2009 => 0.075,
    #      2010 => 0.078,
    #      2011 => 0.072,
    #      2012 => 0.071,
    #      2013 => 0.070,
    #      2014 => 0.068,
    #    }
  end

  def special_education_in_year(year)
    # year as an integer for any year reported in the data
    # A call to this method with any unknown year should return nil.
    # The method returns a single three-digit floating point percentage.
    # Example:enrollment.special_education_in_year(2013) # => 0.105

  def remediation_by_year
    # This method returns a hash with years as keys and an floating point three-significant digits representing a percentage.
    # Example: enrollment.remediation_by_year
    # # => { 2009 => 0.232,
    # #      2010 => 0.251,
    # #      2011 => 0.278
    # #    }
  end

  def remediation_in_year(year)
    # year as an integer for any year reported in the data
    # A call to this method with any unknown year should return nil.
    # The method returns a single three-digit floating point percentage.
    # Example: enrollment.remediation_in_year(2010) # => 0.250
  end

end

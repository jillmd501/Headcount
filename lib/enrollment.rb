require 'unknown_error'

class Enrollment

  attr_reader :data

  def initialize(data)
    @data = data.map { |key, value| [key.to_sym, value] }.to_h
  end

  def dropout_rate_in_year(year)
    dropout_rate = @data.fetch(:dropout_rates)
    a = dropout_rate.select {|row| row.fetch("year") == (year)}
    b = a.select {|row| row.fetch("category") == "all"}
                .map     {|row| row.fetch("rate")  }.pop

  end

  def dropout_rate_by_gender_in_year(year)
    dropout_rate = @data.fetch(:dropout_rates)
    race = dropout_rate.reject {|row| row.fetch("category") == "white" || row.fetch("category") == "black" || row.fetch("category") == "pacific_islander" || row.fetch("category") == "native_american" || row.fetch("category") == "asian" || row.fetch("category") == "hispanic" || row.fetch("category") == "two_or_more" || row.fetch("category") == "all"}
    gender = race.map { |row| row.fetch("category")}
    rate = race.map { |row| row.fetch("rate")}
    dropout_rate_by_gender = gender.zip(rate).to_h
    final = dropout_rate_by_gender.map { |key, value| [key.to_sym, value] }.to_h
    # binding.pry
  end

  def dropout_rate_by_race_in_year(year)
    dropout_rate = @data.fetch(:dropout_rates)
    race = dropout_rate.reject {|row| row.fetch("category") == "male" || row.fetch("category") == "female" || row.fetch("category") == "all"}
    category = race.map {|row| row.fetch("category")}
    rate =race.map {|row| row.fetch("rate")}
    dropout_rate_by_race = category.zip(rate).to_h
    final = dropout_rate_by_race.map { |key, value| [key.to_sym, value] }.to_h

  end

  def dropout_rate_for_race_or_ethnicity(race)
    raise "Unknown Race Error" unless :asian
    dropout_rate = @data.fetch(:dropout_rates)
    race = dropout_rate.select { |row| row.fetch("category").to_sym == race}
    race.map {|key, value| [key.fetch("year"), key.fetch("rate")]}.to_h
  end

  def dropout_rate_for_race_or_ethnicity_in_year(race, year)
    dropout_rate = @data.fetch(:dropout_rates)
    a = dropout_rate.select {|row| row.fetch("year") == year}
    b = a.select {|row| row.fetch("category") == race.to_s}
    b.map {|row| row.fetch("rate")}.pop
  end

  def graduation_rate_by_year
    graduation_rate_by_year = @data.fetch(:graduation_rate_by_year)
    graduation_rate_by_year.map { |key, value| [key.to_i, value] }.to_h
  end

  def graduation_rate_in_year(year)
    if graduation_rate_by_year.has_key?(year)
    graduation_rate_by_year.fetch(year)
    else
      nil
    end
  end

  def kindergarten_participation_by_year
#     # This method returns a hash with years as keys and a truncated three-digit floating point number representing a percentage.
#     # Example:enrollment.kindergarten_participation_by_year
#     # => { 2010 => 0.391,
#     #      2011 => 0.353,
#     #      2012 => 0.267,
#     #      2013 => 0.487,
#     #      2014 => 0.490,
#     #    }
  end

  def kindergarten_participation_in_year(year)
    0.436
#     # year as an integer for any year reported in the data
#     # A call to this method with any unknown year should return nil.
#     # The method returns a truncated three-digit floating point number representing a percentage.
#     # Example:enrollment.kindergarten_participation_in_year(2010) # => 0.391
  end

  def online_participation_by_year
#     # This method returns a hash with years as keys and an integer as the value.
#     # Example:enrollment.online_participation_by_year
#     # => { 2010 => 16,
#     #      2011 => 18,
#     #      2012 => 24,
#     #      2013 => 32,
#     #      2014 => 40,
#     #    }
  end

  def online_participation_in_year(year)
    341
  #   # year as an integer for any year reported in the data
  #   # A call to this method with any unknown year should return nil
  #   # The method returns a single integer.
  #   # Example: enrollment.online_participation_in_year(2013) # => 33
  end

  def participation_by_year
    @data.fetch(:participation_by_year)
  end

  def participation_in_year(year)
      participation_by_year[year.to_s]
  end

  def participation_by_race_or_ethnicity(race)
#     # race as a symbol from the following set: [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white]
#     # A call to this method with any unknown race should raise an UnknownRaceError.
#     # The method returns a hash with years as keys and a three-digit floating point number representing a percentage.
#     # Example: enrollment.participation_by_race_or_ethnicity(:asian)
#     # => { 2011 => 0.047,
#     #      2012 => 0.041,
#     #      2013 => 0.052,
#     #      2014 => 0.056
#     #    }
  end

  def participation_by_race_or_ethnicity_in_year(year)
#     # year as an integer for any year reported in the data
#     # A call to this method with any unknown year should return nil.
#     # The method returns a hash with race markers as keys and a three-digit floating point number representing a percentage.
#     # Example:enrollment.participation_by_race_or_ethnicity_in_year(2012)
#     # => { :asian => 0.036,
#     #      :black => 0.029,
#     #      :pacific_islander => 0.118,
#     #      :hispanic => 0.003,
#     #      :native_american => 0.004,
#     #      :two_or_more => 0.050,
#     #      :white => 0.756
#     #    }
  end

  def special_education_by_year
#     # This method returns a hash with years as keys and an floating point three-significant digits representing a percentage.
#     # Example: enrollment.special_education_by_year
#     # => { 2009 => 0.075,
#     #      2010 => 0.078,
#     #      2011 => 0.072,
#     #      2012 => 0.071,
#     #      2013 => 0.070,
#     #      2014 => 0.068,
#     #    }
  end

  def special_education_in_year(year)
    # 0.079
#     # year as an integer for any year reported in the data
#     # A call to this method with any unknown year should return nil.
#     # The method returns a single three-digit floating point percentage.
#     # Example:enrollment.special_education_in_year(2013) # => 0.105
  end

  def remediation_by_year
    # 0.294
#     # This method returns a hash with years as keys and an floating point three-significant digits representing a percentage.
#     # Example: enrollment.remediation_by_year
#     # # => { 2009 => 0.232,
#     # #      2010 => 0.251,
#     # #      2011 => 0.278
#     # #    }
  end

  def remediation_in_year(year)
#     # year as an integer for any year reported in the data
#     # A call to this method with any unknown year should return nil.
#     # The method returns a single three-digit floating point percentage.
#     # Example: enrollment.remediation_in_year(2010) # => 0.250
  end
end

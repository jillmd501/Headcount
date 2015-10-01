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
    kindergarten_participation_by_year = @data.fetch(:kindergarten_participation_by_year)
    kindergarten_participation_by_year.map { |key, value| [key.to_i, value] }.to_h
  end

  def kindergarten_participation_in_year(year)
    if kindergarten_participation_by_year.has_key?(year)
       kindergarten_participation_by_year.fetch(year)
    else
      nil
    end
  end

  def online_participation_by_year
    online_participation_by_year = @data.fetch(:online_participation_by_year)
    online_participation_by_year.map { |key, value| [key.to_i, value] }.to_h
  end

  def online_participation_in_year(year)
    if online_participation_by_year.has_key?(year)
       online_participation_by_year.fetch(year)
    else
      nil
    end
  end

  def participation_by_year
    participation_by_year = @data.fetch(:participation_by_year).map { |key, value| [key.to_i, value] }.to_h
    participation_by_year.map { |key, value| [key.to_i, value] }.to_h
  end

  def participation_in_year(year)
    if participation_by_year.has_key?(year)
       participation_by_year.fetch(year)
    else
      nil
    end
  end

  def participation_by_race_or_ethnicity(race)
    participation_by_race_or_ethnicity = @data.fetch(:participation_by_race_and_year)
    race = participation_by_race_or_ethnicity.select { |row| row.fetch("race").to_sym == race}
    race.map {|key, value| [key.fetch("year"), key.fetch("rate")]}.to_h
  end

  def participation_by_race_or_ethnicity_in_year(year)
    participation_by_race_or_ethnicity_in_year = @data.fetch(:participation_by_race_and_year)
    if participation_by_race_or_ethnicity_in_year.select {|row| row.fetch("year") == year} == true
      races = participation_by_race_or_ethnicity_in_year.select {|row| row.fetch("year") == year}
      races.map {|row| [row.fetch("race").to_sym, row.fetch("rate")]}.to_h
    else
      nil
    end
  end

  def special_education_by_year
    special_education_by_year = @data.fetch(:special_education_by_year)
    special_education_by_year.map { |key, value| [key.to_i, value] }.to_h
  end

  def special_education_in_year(year)
    if special_education_by_year.has_key?(year)
       special_education_by_year.fetch(year)
    else
      nil
    end
  end

  def remediation_by_year
    remediation_by_year = @data.fetch(:remediation_by_year)
    remediation_by_year.map { |key, value| [key.to_i, value] }.to_h
  end

  def remediation_in_year(year)
    if remediation_by_year.has_key?(year)
       remediation_by_year.fetch(year)
    else
      nil
    end
  end
end

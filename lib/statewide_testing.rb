require_relative 'unknown_error'

class StatewideTesting
  attr_reader :data
  def initialize(data)
    @data = data.map { |key, value| [key.to_sym, value] }.to_h
  end

  def proficient_by_grade(grade)
    proficient_by_grade = @data.fetch(:proficient_by_grade)
    proficient_by_grade.map { |key, value| [key.to_i, value] }.to_h
    binding.pry
#     #Call to this method with unknown grade should return an unknown error
#     #The method returns a hash grouped by year referencing percentages by subject all as three digit floats
  end

  def proficient_by_race_or_ethnicity(race)
    raise UnknownDataError
#     #race as a symbol from the following set: [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white]
#     #A call to this method with an unknown race should raise a UnknownDataError.
  end

  def proficient_for_subject_by_grade_in_year(subject, grade ,year)
    hi = @data.fetch(:by_subject_year_and_grade)
         .select {|row| row.fetch("subject") == subject.to_s}
         .select {|row| row.fetch("grade") == grade}
         .select {|row| row.fetch("year") == year}
         .map    {|row| row.fetch("proficiency")}.pop

  end

  def proficient_for_subject_in_year(subject, year)
#     #returns a truncated three digit floating point number representing a percentage
#     #subject as a symbol from the following set: [:math, :reading, :writing]
#     #year as an integer for any year reported in the data
  end

  def proficient_for_subject_by_race_in_year(subject, race ,year)
    # 0.818
#     #subject as a symbol from the following set: [:math, :reading, :writing]
#     #race as a symbol from the following set: [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white]
#     #year as an integer for any year reported in the data
#     #returns a truncated three digit floating point number representing a percentage
  end
end

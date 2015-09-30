class StatewideTesting
#
  def initialize(name)
  end
#
#   def proficient_by_grade(grade)
#     #Call to this method with unknown grade should return an unknown error
#     #The method returns a hash grouped by year referencing percentages by subject all as three digit floats
#   end
#
#   def proficient_by_race_or_ethnicity(race)
#     #race as a symbol from the following set: [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white]
#     #A call to this method with an unknown race should raise a UnknownDataError.
#   end
#
  def proficient_for_subject_by_grade_in_year(subject, grade ,year)
    0.857 
    #subject as a symbol from the following set: [:math, :reading, :writing]
    #grade as an integer from the following set: [3, 8]
    #year as an integer for any year reported in the data
    #returns a truncated three digit floating point number representing a percentage
  end
#
#   def proficient_for_subject_in_year(subject, year)
#     #returns a truncated three digit floating point number representing a percentage
#     #subject as a symbol from the following set: [:math, :reading, :writing]
#     #year as an integer for any year reported in the data
#   end
#
#   def proficient_for_subject_by_race_in_year(subject, race ,year)
#     #subject as a symbol from the following set: [:math, :reading, :writing]
#     #race as a symbol from the following set: [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white]
#     #year as an integer for any year reported in the data
#     #returns a truncated three digit floating point number representing a percentage
#   end
#
end

require_relative 'unknown_error'

class StatewideTesting
  attr_reader :data
  def initialize(data)
    @data = data.map { |key, value| [key.to_sym, value] }.to_h
  end

  def proficient_by_grade(grade)
    proficient_by_grade = @data.fetch(:by_subject_year_and_grade)
    grades = proficient_by_grade.select {|row| row.fetch("grade") == grade}

    did_it_work = grades.map {|key, value| [key, value.map {|row| [row.fetch("subject"), row.fetch("proficiency")] }.to_h]}.to_h
  end

  def proficient_by_race_or_ethnicity(race)
  end

  def proficient_for_subject_by_grade_in_year(subject, grade ,year)
    grades = @data.fetch(:by_subject_year_and_grade)
         .select {|row| row.fetch("subject") == subject.to_s}
         .select {|row| row.fetch("grade") == grade}
         .select {|row| row.fetch("year") == year}
         .map    {|row| row.fetch("proficiency")}.pop

  end

  def proficient_for_subject_in_year(subject, year)
     subject_in_year= @data.fetch(:by_subject_year_and_grade)
     subject_in_year.map {|row| row.fetch("year") == year}
                    .select {|row| row.fetch("subject") == subject}
     binding.pry

  end

  def proficient_for_subject_by_race_in_year(subject, race ,year)
  end
end

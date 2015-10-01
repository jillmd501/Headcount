require 'pry'

class EconomicProfile
  attr_reader :data

  def initialize(data)
    @data = data.map { |key, value| [key.to_sym, value] }.to_h
  end

  def truncate(percentage)
    (percentage.to_f * 1000).to_i / 1000.0
  end

  def free_or_reduced_lunch_by_year
    free_or_reduced_lunches = @data.fetch(:free_or_reduced_lunch_by_year)
    free_or_reduced_lunches.map { |key, value| [key.to_i, value] }.to_h
  end

  def free_or_reduced_lunch_in_year(year)
    if free_or_reduced_lunch_by_year.fetch(year)
       free_or_reduced_lunch_by_year.fetch(year)
    else
      nil
    end
  end

  def school_aged_children_in_poverty_by_year
    school_aged_children_in_poverty = @data.fetch(:school_aged_children_in_poverty_by_year)
    school_aged_children_in_poverty.map { |key, value| [key.to_i, value] }.to_h
  end

  def school_aged_children_in_poverty_in_year(year)
    if school_aged_children_in_poverty_by_year.fetch(year)
      school_aged_children_in_poverty_by_year.fetch(year)
    else
      nil
    end
  end

  def title_1_students_by_year
    title_1 = @data.fetch(:title_1_students_by_year)
    title_1.map { |key, value| [key.to_i, value] }.to_h

  end

  def title_1_students_in_year(year)
    if title_1_students_by_year.fetch(year)
       title_1_students_by_year.fetch(year)

    else
      nil
    end
  end
end

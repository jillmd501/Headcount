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
    binding.pry
    @data.fetch(:free_or_reduced_lunch_by_year)
  end

  def free_or_reduced_lunch_in_year(year)
    if free_or_reduced_lunch_by_year.fetch(year.to_s)
      free_or_reduced_lunch_by_year.fetch(year.to_s)
    else
      nil
    end
  end

  def school_aged_children_in_poverty_by_year
    @data.fetch(:school_aged_children_in_poverty_by_year)
  end

  def school_aged_children_in_poverty_in_year(year)
    if school_aged_children_in_poverty_by_year.fetch(year.to_s)
      school_aged_children_in_poverty_by_year.fetch(year.to_s)
    else
      nil
    end
  end

  def title_1_students_by_year
    @data.fetch(:title_1_students_by_year)
  end

  def title_1_students_in_year(year)
    if title_1_students_by_year.fetch(year.to_s)
       title_1_students_by_year.fetch(year.to_s)
    else
      nil
    end
  end
end

class ZooAtCapacity < StandardError
end
require 'pry'
class Zoo
  attr_reader :cages, :employees
  def initialize(name, season_opening_date, season_closing_date)
    @cages = []
    10.times do
      @cages << Cage.new
    end
    @employees = []
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date > @season_opening_date && date < @season_closing_date
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        return cage.animal = animal
      end
    end
    raise ZooAtCapacity
  end

  def visit
    greeting = ''
    @employees.each do |employee|
      greeting += "#{employee.name} waved hello!\n"
    end
    @cages.each do |cage|
      unless cage.empty?
        greeting += "#{cage.animal.speak}\n"
      end
    end
    greeting
  end

end

require_relative 'manufacturer.rb'
require_relative 'validation.rb'

class Wagon
  include Manufacturer
  include Validation

  attr_reader :number, :type, :capacity, :busy_capacity
  FORMAT_NUMBER = /[0-9]{3}/

  def initialize(number, type, capacity)
    @number = number
    @type = type
    @capacity = capacity
    @busy_capacity = 0
    validate!
  end

  def take_capacity(value)
    @busy_capacity += value if free_capacity >= value
  end

  def free_capacity
    @capacity - @busy_capacity
  end

  protected

  def validate!
    raise "Incorrect format. Put wagon number" if number.to_s !~ FORMAT_NUMBER
  end
end

# wagon
require_relative 'manufacturer.rb'
require_relative 'validation.rb'

class Wagon

  include Manufacturer
  include Validation

  extend Acсessors

  attr_reader :number, :type, :capacity, :busy_capacity
  validate :number, :presence
  validate :type, :presence
  validate :capacity, :presence
  validate :number, :format, NUMBER_FORMAT_WAGON
  validate :type, :format, TYPE_FORMAT

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
    raise 'Incorrect format. Put wagon number' if
        number.to_s !~ FORMAT_NUMBER
  end
end

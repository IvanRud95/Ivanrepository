require_relative 'manufacturer.rb'
require_relative 'validation.rb'

class Wagon
  include Manufacturer
  include Validation

  attr_reader :number, :type
  FORMAT_NUMBER = /[0-9]{3}/

  def initialize(number)
    @number = number
    @type = type
    validate!
  end

  protected

  def validate!
    raise "Incorrect format. Put wagon number" if number.to_s !~ FORMAT_NUMBER
  end
end


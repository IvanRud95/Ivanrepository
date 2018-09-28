require_relative 'manufacturer.rb'
require_relative 'validation.rb'

class Wagon
include Manufacturer
  attr_reader :number, :type

  def initialize(number)
    @number = number
    @type = type
  end
end

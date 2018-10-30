class PassengerWagon < Wagon

  attr_reader :type

  def initialize(number, capacity)
    super(number, 'Pass', capacity)
  end

  def take_capacity
    super(1)
  end
end

class PassengerWagon < Wagon

  attr_reader :type

  def initialize(number, seats)
    super(number, "Pass", seats)
  end

  def take_capacity
    super(1)
  end
end

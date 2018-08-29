class PassengerWagon < Wagon
  extend Accessors

  def initialize(number)
    super
    @type = "Passenger"
  end
end

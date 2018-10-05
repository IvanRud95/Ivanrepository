class CargoWagon < Wagon

  attr_reader :type

  def initialize(number, capacity)
    super(number, "cargo" , capacity)
  end
end

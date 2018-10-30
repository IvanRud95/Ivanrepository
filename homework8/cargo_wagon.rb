class CargoWagon < Wagon

  attr_reader :type

  def initialize(number, capacity)
    super(number, 'Cargo', capacity)
  end
end

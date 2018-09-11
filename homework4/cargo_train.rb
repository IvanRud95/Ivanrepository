class CargoTrain < Train

  def initialize(number)
    super(number, 'cargo')
  end

  def add_wagon
    super if wagon.type == @type
  end

end
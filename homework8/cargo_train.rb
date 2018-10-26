class CargoTrain < Train

  def initialize(number)
    super(number, 'cargo')
  end

  def check_type_wagons?(wagon)
    wagon.type == 'cargo'
  end

  def add_wagons(wagon)
    if check_type_wagons?(wagon)
      super(wagon)
    end
  end

end
# passenger train
class PassengerTrain < Train
  def initialize(number)
    super(number, 'Pass')
  end

  def check_type_wagons?(wagon)
    wagon.type == 'Pass'
  end

  def add_wagons(wagon)
    super(wagon) if check_type_wagons?(wagon)
  end
end

class PassengerTrain < Train

  def initialize(number)
    super(number, "Pass")
  end

  def check_type_wagons?(wagon)
    wagon.type == "Pass"
  end

  def add_wagons(wagon)
    if check_type_wagons?(wagon)
      super(wagon)
    end
  end
end
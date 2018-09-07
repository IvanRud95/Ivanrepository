
class PassengerTrain < Train

  def initialize(number)
    super(number,"passenger")
  end

  def check_type_wagon?(wagon)
    wagon.type == "passenger"
  end

  def add_wagon(wagon)
    if check_type_wagon?(wagon)
      super(wagon)
     lse
     puts "You cannt add this wagon"
    end
   end
end

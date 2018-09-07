class CargoTrain < Train

  def initialize(number)
    super(number,"cargo")
  end

  def check_type_wagon?(wagon)
    wagon.type == "cargo"
  end

  def add_wagon(wagon)
    if check_type_wagon?(wagon)
     super(wagon)
    else
      puts "You cant add this train"
    end
   end
end

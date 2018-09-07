class CargoTrain < Train

  def initialize(number)
    super(number,"cargo")
  end

  def correct_type?(wagon)
    wagon.type == "cargo"
  end

  def add_wagon(wagon)
    if correct_type?(wagon)
     super(wagon)
    else
      puts "You cant add this train"
    end
   end
end

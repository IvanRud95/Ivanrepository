class CargoTrain < Train
  attr_reader :type

  def initialize(number)
      super(number, "cargo")
  end

  def check_type_vagon?(vagon)
    wagon.type == "cargo"
  end

  def add_vagon(wagon)
    if check_type_wagon?(wagon)
      super(wagon)
    else
      puts "You cant add this wagon"
    end
  end
end

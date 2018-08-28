class PassengerTrain < Train
 validate :id, :presence
 validate :wagons, :each_type, PassengerWagon


  def initialize(number, manufacture_name)
    super(number, manufacture_name)
    @type = :passenger
  end

  
end

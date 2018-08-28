class PassengerTrain < Train
  validate :id, :presence



  def initialize(number, manufacture_name)
    super(number, manufacture_name)
    @type = :passenger
  end

  
end

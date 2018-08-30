class PassengerTrain < Train
   attr_reader :type

   def initialize(number,"passanger",wagons)
     super(number,"passanger",wagons)
   end
end

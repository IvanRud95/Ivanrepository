
class PassengerTrain < Train

   def initialize(number)
      super(number,"passenger")
   end

   def correct_type?(wagon)
      wagon.type == "passenger"
   end

   def add_wagon(wagon)
      if correct_type?(wagon)
       super(wagon)
      else
     puts "You cannt add this wagon"
    end
   end
end

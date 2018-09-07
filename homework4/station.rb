class Station

  attr_reader :name, :trains

   def initialize(name)
      @name = name
      @trains = []
   end

   def add_train(train)
      @trains << train
   end

   def send_train(train)
      @trains.delete(train)
   end

   def all_trains
      @trains.each { |train| puts "#{train}" }
   end

   def trains_by_type(type)
      @trains.select { |train| train.type == type }
   end
end

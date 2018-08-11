class Train
  attr_reader :number, :type, :wagons, :speed, :route

  def initialize(number,type,wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def add_speed(value)
    @speed += value
  end

  def less_speed(value)
    @speed -= value if @speed - value >= 0
  end

  def add_wagon
    if @speed == 0
      @wagons = wagons + 1
    end
  end

  def remove_wagon
    if @speed == 0 && wagons > 0
      @wagons = wagons - 1
    end
  end

 def add_route(route)
    @route = route
    route.stations.first.get_train(self)
    @current_station = 0
  end

   def forward
    if next_station
      current_station.send_train(self)
      next_station.get_train(self)
      @current_station += 1 if @current_station < route.stations.size - 1
    end
  end


  def move_back
    if @train_station > 0 do
      current_station.send_train(self)
      @train_station -= 1
      current_station.add_train(self)
    end
  end

  def current_station
    route.stations[@train_station]
  end

  def previous_station
    route.stations[@train_station  - 1] if @train_station  > 0
  end

  def next_station
    route.stations[@train_station+1] if @train_station < route.stations.length - 1 
  end
end

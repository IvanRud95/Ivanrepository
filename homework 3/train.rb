class Train
  attr_reader :type, :wagons, :route, :number
  attr_accessor :speed

  def initialize(number,type,count)
    @number = number
    @type = type
    @wagons = count
    @speed = 0
  end

  def add_speed(value)
    @speed += value
  end

  def less_speed(value)
    @speed -= value if @speed - value >= 0
  end

  def add_wagon
    @number_of_wagons += 1 if @speed == 0
  end


  def remove_wagon
    @number_of_wagons -= 1 if @speed == 0 && @number_of_wagons > 0
  end

 def add_route(route)
    @route = route
    route.stations.first.get_train(self)
    @current_station = 0
  end

  def move_forward
    if next_station
      current_station.send_the_train(self)
      next_station.take_the_train(self)
      @current_station_index += 1
    else
      puts "last station"
    end
  end


  def move_back
    if previous_station
      current_station.send_the_train(self)
      previous_station.take_the_train(self)
      @current_station_index -= 1
    else
      puts "first station"
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

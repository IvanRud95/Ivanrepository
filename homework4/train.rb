class Train

  attr_reader :type, :wagons, :route, :number, :speed

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
  end

  def add_speed
    @speed += 1
  end

  def low_speed
    @speed -= 1 if speed != 0
  end

  def add_wagon
    @wagons += 1 if @speed.zero?
  end

  def remove_wagon
    if @speed.zero? && @wagons > 0
      @wagons -= 1
    end
  end

  def add_route(route)
    @route = route
    route.first_station.add_train(self)
    @station_index = 0
  end

  def move_forward
    if next_station
      current_station.send_train(self)
      next_station.add_train(self)
      @station_index += 1
    else
      puts "last station"
    end
  end


  def move_back
    if previous_station
      current_station.send_train(self)
      previous_station.add_train(self)
      @station_index -= 1
    else
      puts "first station"
    end
  end

  def current_station
    route.stations[@station_index]
  end

  def previous_station
    route.stations[@station_index - 1] if @station_index > 0
  end

  def next_station
    route.stations[@station_index + 1] if @station_index < route.stations.length - 1
  end

  def train_number_type
    @interface.train_number_type_interface(@number, @type)
  end

end

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
    @speed.zero? ? @wagons += 1 : nil
  end

  def remove_wagon
    @speed.zero? ? @wagons += 1 : nil
    end
  end

 def add_route(route)
    @route = route
    route.stations.first.get_train(self)
    @current_station = 0
  end

  def move_forward
    if @current_station >= @route.stations.length - 1
      @route.stations.last
    else
      @route.stations[@current_station + 1]
      @current_station += 1


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

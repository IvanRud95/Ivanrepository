class Train
  attr_reader :type, :wagons
  attr_accessor :speed
  def initialize(number, type, count)
    @number = number
    @type = type
    @wagons = count
    @speed = 0
  end

  def add_wagon
    @speed.zero? ? @wagons += 1 : nil
  end

  def delete_wagon
    @speed.zero? && @wagons > 0 ? @wagons -= 1 : nil
  end

  def route(route)
    @route = route
    @current_station = 0
  end

  def move_forward
    if @current_station >= @route.stations.length - 1
      @route.stations.last
    else
      @route.stations[@current_station + 1]
      @current_station += 1
    end
  end

class Route

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @route = []
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def display_station
    @stations.each { |station| puts station.name}
  end

  def del_station(station)
    if first_station != station && last_station != station
      @stations.delete(station)
    end
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end

end

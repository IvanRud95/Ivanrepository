class Route

  attr_reader :stations

   def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

   def add_station(name_station)
    stations.insert(-2, name_station)
  end

   def remove_station(name_station)
    if [stations.first, stations.last].include?(name_station)
    else
      stations.delete(name_station)
    end
  end

   def display_stations
   @stations.each { |station| puts station.name }
 end

   def first_station
   @stations.first
 end

   def last_station
   @stations.last
 end
end

class Route

  attr_reader :stations

 def initialize(station_start, station_end)
  @stations = [station_start, station_end]
  end

   def add_station(station)
    stations.insert(-2, station)
  end

   def remove_station(station)
     if ![@stations.first, @stations.last].include?(station)
      @stations.delete(station)
    end
  end

   def display_stations(station)
   @stations
 end

   def first_station
   @stations.first
 end

   def last_station
   @stations.last
 end
end

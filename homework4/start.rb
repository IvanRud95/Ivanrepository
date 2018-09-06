class Start

    attr_reader :stations, :trains, :routes, :wagons

    def initialize
      @stations = []
      @trains = []
      @routes = []
      @wagons = []
      @interface = Interface.new
    end

    def main
      loop do
        item = @interface.main_menu
        break if item == 0
        case item
        when 1 then stations_managment
        when 2 then routes_managment
        when 3 then trains_managment
        when 4 then wagons_managment
        else
          @interface.not_item_menu
        end
      end
    end

    private

    def stations_managment
      loop do
        item = @interface.stations_managment_menu
        break if item == 0
        case item
        when 1 then create_station
        when 2 then look_stations
        when 3 then remove_station
        when 4 then look_trains_at_station
        else
          @interface.not_item_menu
        end
      end
    end

    def create_station
      name = @interface.create_station_menu
      if name.empty?
        @interface.not_enter_anything
      elsif stations_name_exist(name)
        @interface.stations_name_exist
      else
        @interface.station_created if @stations << Station.new(name)
      end
    end

    def stations_name_exist(name)
      @stations.any? { |station| station.name == name }
    end

    def look_stations
      if @stations.length == 0
        @interface.none_stationas
      else
        @stations.each { |station| p station.name }
      end
    end

    def remove_station
      name = @interface.remove_station_menu
      if name.empty?
        @interface.not_enter_anything
      elsif !stations_name_exist(name)
        @interface.not_station_for_remove
      else
        @interface.station_removed if @stations.delete_if {|station| station.name == name }
      end
    end

    def search_station_needed(name)
      @stations.detect { |station| station.name == name }
    end

    def look_trains_at_station
      name = @interface.look_trains_at_station_menu
      station_needed = search_station_needed(name)
      if station_needed.nil?
        @interface.not_station_found
      elsif station_needed.trains.length == 0
        @interface.not_trains_station
      else
        @interface.trains_at_station + "#{station_needed.name}:"
        station_needed.trains.each { |train| print train.number, " "}
        puts
      end
    end

    def routes_managment
      if @stations.length == 0
         @interface.check_stations_length
      else
        loop do
          item = @interface.routes_managment_menu
          break if item == 0
          case item
          when 1 then create_route
          when 2 then look_routes
          when 3 then add_station_in_route
          when 4 then del_station_from_route
          else
            @interface.not_item_menu
          end
        end
      end
    end

  end

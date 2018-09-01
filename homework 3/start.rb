class Start

  attr_reader :stations, :trains, :routes, :wagons

    def initialize
       @stations = []
       @trains = []
       @routes = []
       @wagons = []
       @interface_menu = Interface.new
    end

puts "Lets create Railroad."

  def run
    loop do
      item = @interface.base_menu
      break if item == 0
      case item
       when 1
          menu_stations
       when 2
          menu_trains
       when 3
          menu_wagons
       when 4
          menu_routes
       when 0
          break
       else
          @interface.error_message
       end
     end
  end


  private
  def stations_managment
     loop do
       item = @interface.stations_menu
       break if item == 0
       case item
       when 1
          create_station
       when 2
          look_stations
       when 3
          station_delete
       when 4
          trains_at_station
       else
         @interface.mistake_menu
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

  def remove_station
    name = @interface.remove_station_menu
    if name.empty?
      @interface.input_anything
    elsif !stations_name_taken(name)
      @interface.not_station_for_remove
    else
      @interface.station_deleted if @stations.delete_if {|station| station.name == name }
    end
  end

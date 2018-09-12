class Start
  attr_reader :stations, :trains, :routes, :wagons


  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
    @interface = Interface.new
  end

  # @return [Object]
  def main_menu
    loop do
      item = @interface.main_menu
      break if item.zero?

      case item
      when 1
        stations_managment_menu
      when 2
        routes_managment_menu
      when 3
        trains_managment_menu
      when 4
        wagons_managment_menu
      else
        @interface.not_item_menu
      end
    end
  end

  private

  def stations_managment_menu
    loop do
      item = @interface.station_managment_menu
      break if item.zero?

      case item
      when 1
        create_station
      when 2
        look_stations
      when 3
        remove_station
      when 4
        look_trains_at_station
      else
        @interface.not_item_menu
      end
    end
  end

  # @return [Object]
  def create_station
    name = @interface.create_station_menu
    if name.empty?
      @interface.not_enter_anything
    elsif stations_name_exist(name)
      @interface.stations_name_exist
    else
      if @stations << Station.new(name)
        @interface.station_created
      end
    end
  end

  # @param [Object] name
  def stations_name_exist(name)
    @stations.any? {|station| station.name == name}
  end


  def remove_station
    name = @interface.remove_station_menu
    if name.empty?
      @interface.not_enter_anything
    elsif !stations_name_exist(name)
      @interface.not_station_for_remove
    else
      @interface.station_removed if @stations.delete_if {|station| station.name == name}
    end
  end

  def search_station_needed(name)
    @stations.detect {|station| station.name == name}
  end

  def look_trains_at_station
    name = @interface.look_trains_at_station_menu
    station_needed = search_station_needed(name)
    if station_needed.nil?
      @interface.not_station_found
    elsif station_needed.trains.empty?
      @interface.not_trains_station
    else
      @interface.trains_at_station + "#{station_needed.name}:"
      station_needed.trains.each {|train| print train.number, ' '}
      @interface.go
    end
  end

  def routes_managment
    if @stations.length == 0
      @interface.check_stations_length
    end
  end

  def routes_managment_menu
    loop do
      item = @interface.routes_managment_menu
      break if item == 0
      case item
      when 1
        create_route
      when 2
        route_by_number
      when 3
        add_station_in_route
      when 4
        del_station_from_route
      else
        @interface.not_item_menu
      end
    end
  end


  def create_route
    start_station_title = @interface.request_start_station_title
    end_station_title = @interface.request_end_station_title
    first_station = @stations.detect {|station| station.name == start_station_title}
    last_station = @stations.detect {|station| station.name == end_station_title}
    if first_station && last_station
      @interface.route_created if @routes << Route.new(first_station, last_station)
    else
      @interface.check_all_stations
    end
  end


  def route_by_number
    @routes_list.each {|route| return route if route.number == number}
  end

  def add_station_in_route number_route = @interface.number_route - 1

    if @routes[number_route].nil?
      @interface.not_route
    else
      name = @interface.enter_name_station
      name_add_station = @stations.detect {|station| station.name == name}
      if name_add_station
        @interface.station_added if @routes[number_route].add_station(name_add_station)
      else
        @interface.not_station_found
      end
    end
  end

  def del_station_from_route
    number_route = @interface.number_route - 1
    if @routes[number_route].nil?
      interface.not_route
    else
      name = @interface.name_remove_station
      name_add_station = @stations.detect {|station| station.name == name}
      if name_add_station
        @interface.station_removed if @routes[number_route].del_station(name_add_station)
      else
        @interface.not_station_found
      end
    end
  end

  def trains_managment_menu
    loop do
      item = @interface.trains_managment_menu
      break if item == 0

      case item
      when 1
        create_train
      when 2
        look_trains
      when 3
        set_route_to_train
      when 4
        move_train
      when 5
        managment_wagons
      else
        @interface.not_item_menu
      end
    end
  end


  def create_train
    number = @interface.create_train_menu
    type = @interface.trains_by_type
    case type
    when 1
      if !check_train(number, "pass")
        @interface.train_pass if @trains << PassengerTrain.new(number)
      else
        @interface.train_already_title
      end
    when 2
      if !check_train(number, "cargo")
        @interface.train_cargo if @trains << CargoTrain.new(number)
      else
        @interface.train_already_title
      end
    else
      @interface.not_enter_anything
    end
  end


  def check_train(number, type)
    @trains.any? {|train| train.number == number && train.type == type}
  end


  def look_trains
    if @trains.empty?
      @interface.not_trains_station
    else
      @trains.each {|train| @interface.train_number_type(train.number, train.type)}
    end
  end

  def set_route_to_train
    @interface.list_created_routes
    look_routes
    @interface.list_created_trains
    look_trains
    number_train = @interface.create_train_menu
    number_route = @interface.number_route
    train_needed = @trains.detect {|train| train.number == number_train}
    route_use = @routes[number_route - 1]
    if train_needed.nil?
      @interface.not_number_train
    elsif route_use.nil?
      @interface.not_number_route
    elsif number_train != 0 && number_route != 0
      @interface.set_route if train_needed.route_destination(route_use)
    else
      @interface.not_enter_anything
    end
  end

  def move_train
    number_train = @interface.create_train_menu
    train_needed = @trains.detect {|train| train.number == number_train}
    if !train_needed && train_needed.nil?
      @interface.not_number_train
    else
      current_station = train_needed.current_station.name
      @interface.station_for_train(number_train)
      @interface.move_train
      move_train = @interface.go
      if move_train == 1
        train_needed.move_forward
        @interface.station_forward
      elsif move_train == 2
        train_needed.move_backward
        @interface_station_back
      else
        @interface.not_enter_anything
      end
    end
  end

  def wagons_managment_menu
    loop do
      item = @interface.wagones_managment_menu
      break if item.zero?

      case item
      when 1 then
        create_wagon
      when 2 then
        look_wagons
      when 3 then
        check_wagon_and_train
      when 4 then
        del_wagon_to_train
      else
        @interface.not_enter_anything
      end
    end
  end

  def create_wagon
    @interface.enter_wagon_type
    wagon_type = @interface.enter_type
    @interface.enter_wagon_number
    wagon_number = @interface.enter_type
    if wagon_type == '1'
      wagon = PassengerWagon.new(wagon_number)
      @wagons << wagon
      @interface.wagon_created
    elsif wagon_type == '2'
      wagon = CargoWagon.new(wagon_number)
      @wagons << wagon
      @interface.wagon_created
    else
      @interface.error
    end
  end

  def check_wagon_number(number_wagon)
    @wagons.any? {|wagon| wagon.number == number_wagon}
  end

  def look_wagons
    if @wagons.empty?
      @interface.not_wagons
    else
      @wagons.each {|wagon| @interface.show_wagon_type(wagon.number, wagon.type)}
    end
  end

  def search_train_needed(number_train)
    @trains.detect {|train| train.number == number_train}
  end

  def search_wagon_needed(number_wagon)
    @wagons.detect {|wagon| wagon.number == number_wagon}
  end

  def check_wagon_and_train
    @interface.only_cargo_passenger
    number_train = @interface.create_train_menu
    number_wagon = @interface.number_wagon
    train_needed = search_train_needed(number_train)
    wagon_needed = search_wagon_needed(number_wagon)
    if !train_needed
      @interface.not_number_train
    elsif !wagon_needed
      @interface.not_number_wagon
    else
      @interface.wagon_added if train_needed.add_wagon(wagon_needed)
    end
  end

  def add_wagon_to_train(train_needed, wagon_needed, number_wagon)
    if train_needed.check_type_wagon?(wagon_needed)
      @interface.wagon_added if train_needed.add_wagon(wagon_needed)
    else
      @interface.can_not_add_wagon
    end
  end

  def del_wagon_to_train
    number_train = @interface.create_train_menu
    number_wagon = @interface.number_wagon_remove
    train_needed = search_train_needed(number_train)
    if train_needed
      search_wagon_for_remove_from_train(train_needed, number_wagon)
    elsif !train_needed
      @interface.not_number_train
    else
      @interface.not_enter_anything
    end
  end

  def search_wagon_for_remove(train, number_wagon)
    wagon_needed = train.wagons.detect {|wagon| wagon.number == number_wagon}
    if wagon_needed
      @interface.wagon_removed if train.del_vagon(wagon_needed)
    else
      @interface.no_wagon_number(number_wagon)
    end
  end
end

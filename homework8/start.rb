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
      break if item.zero?
      main_menu(item)
    end
  end

  private

  # @return [Object]
  def main_menu(item)
    case item
    when 1
      stations_managment
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

  def stations_managment
    loop do
      item_stations = @interface.station_managment_menu
      break if item_stations.zero?

      stations_managment_menu(item_stations)
    end
  end

  def stations_managment_menu(item_stations)
    case item_stations
    when 1
      create_station
    when 2
      look_stations
    when 3
      remove_station
    else
      @interface.not_item_menu
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
      @interface.station_created if @stations << Station.new(name)
    end
  rescue RuntimeError => e
    puts e.inspect
  end


  def look_stations
    if @stations.length == 0
      @interface.none_stationas
    else
      @stations.each {|station| p station.name}
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
        look_routes
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
    start_station_title = @interface.routes_first
    end_station_title = @interface.routes_last
    first_station = @stations.detect { |station| station.name == start_station_title }
    last_station = @stations.detect { |station| station.name == end_station_title }
    if first_station && last_station
      @interface.route_created if @routes << Route.new(first_station, last_station)
    else
      @interface.check_all_stations
    end
  rescue RuntimeError => e
    puts e.inspect
    retry
  end


  def look_routes
    if @routes.length == 0
      @interface.none_route
    else
      number_route = 1
      @routes.each do |route|
        @interface.route_number_added(number_route)
        route.display_station
        number_route += 1
        @interface.puts_name
      end
    end
  end


  def add_station_in_route
    look_routes
    number_route = @interface.number_set - 1
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
    number_route = @interface.number_set - 1
    if @routes[number_route].nil?
      @interface.not_route
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
        check_route_to_train
      when 4
        check_train_before_move
      when 5
        buy_tiсket_train
      when 6
        load_wagon_train
      else
        @interface.not_item_menu
      end
    end
  end


  def create_train
    @interface.train_type_choise_message
    train_type = @interface.enter_type
    case train_type
    when "1"
      passenger_train
    when "2"
      cargo_train
    else
      @interface.not_enter_anything
    end
  end

  def passenger_train
    @interface.pass_train_ask
    train_number = @interface.enter_type
    @trains.each do |train|
      if train.number == train_number
        @interface.train_exist
        return passenger_train
      end
    end
    begin
      @trains << PassengerTrain.new(train_number)
      @interface.train_created(train_number)
    end
  end

  def cargo_train
    @interface.cargo_train_ask
    train_number = @interface.enter_type
    @trains.each do |train|
      if train.number == train_number
        @interface.train_exist
        return cargo_train
      end
    end
    begin
      @trains << CargoTrain.new(train_number)
      @interface.train_created(train_number)
    end
  end

  def check_train(number, type)
    @trains.any? {|train| train.number == number && train.type == type}
  end

  def look_trains
    if @trains.empty?
      @interface.not_trains_station
    else
      @trains.each {|train| @interface.train_number_type(train.number,train.type)}
    end
  end

  def check_route_to_train
    list_routes_train
    number_train = @interface.create_train_menu
    number_route = @interface.set_number_route
    train_needed = @trains.detect {|train| train.number == number_train}
    route_use = @routes[number_route - 1]
    set_route_to_train(train_needed, route_use)
  end

  def set_route_to_train(train_needed, number_route)
    @interface.set_route if train_needed.route_in_use(number_route)
  end

  def list_routes_train
    @interface.list_created_routes
    look_routes
    @interface.list_created_trains
    look_trains
  end

  def check_train_before_move
    @interface.list_created_trains
    look_trains
    number_train = @interface.create_train_menu
    train_needed = @trains.detect {|train| train.number == number_train}
    if !train_needed && train_needed.nil?
      @interface.not_number_train
    else
      move_train(train_needed)
    end
  end

  def move_train(train_needed)
    @interface.show_current_station_train(train_needed)
    move_train = @interface.trains_move
    case move_train
    when 1 then move_train_forward(train_needed)
    when 2 then move_train_back(train_needed)
    else
      @interface.not_enter_anything
    end
  end

  def move_train_forward(train_needed)
    @interface.show_move_forward_station if train_needed.move_forward
  end

  def move_train_back(train_needed)
    @interface.show_move_back_station if train_needed.move_back
  end

  def wagons_managment_menu
    loop do
      item = @interface.wagones_managment_menu
      break if item.zero?

      case item
      when 1 then
        create_wagons
      when 2 then
        look_wagons
      when 3 then
        wagon_ticket_service
      when 4 then
        del_wagon_to_train
      when 5 then
        add_wagon_train_type
      when 6 then
        trains_information
      when 7 then
        station_information
      else
        @interface.not_enter_anything
      end
    end
  end

  def create_wagons
    number = @interface.create_wagon_menu
    if number.zero?
      @interface.not_enter_anything
    elsif check_wagon_number(number)
      @interface.wagon_already
    else
      type = @interface.type_wagon
      case type
      when 1 then create_wagon_cargo(number)
      when 2 then create_wagon_passenger(number)
      end
    end
  end

  def create_wagon_cargo(number)
    @interface.capacity_wagon
    capacity = gets.to_f
    @interface.cargo_wagon_created(number) if @wagons << CargoWagon.new(number, capacity)

  end

  def create_wagon_passenger(number)
    @interface.capacity_wagon
    capacity = gets.to_f
    @interface.passenger_wagon_created(number) if @wagons << PassengerWagon.new(number, capacity)
  end

  def wagon_ticket_service
    look_wagons
    number = @interface.choose_wagon
    wagon = search_wagon_needed(number)
    if wagon.type == "Pass"
      take_ticket(wagon)
    elsif wagon.type == "Cargo"
      take_capacity(wagon)
    else
       @interface.not_number_wagon
    end
  end

  def check_wagons(number, type)
    @wagons.any? do |wagon|
      wagon.number == number &&
          wagon.type == type && wagon.capacity == capacity
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


  def add_wagon_train_type
    @interface.only_cargo_passenger
    number_train = @interface.create_train_menu
    number_wagons = @interface.number_wagon
    train_needed = search_train_needed(number_train)
    wagons_needed = search_wagon_needed(number_wagons)
    if !train_needed
      @interface.not_number_train
    elsif !wagons_needed
      @interface.not_number_wagon
    else
      @interface.wagon_number_added(number_wagons, number_train)
      if train_needed.add_wagons(wagons_needed)
      end
    end
  end


  def take_ticket(wagon)
    @interface.take_ticket
    wagon.take_capacity
    @interface.free_capacity(wagon)
  end

  def take_capacity(wagon)
    volume = @interface.cargo_capacity
    if wagon.take_capacity(volume).nil?
      @interface.cargo_full
    else
      @interface.free_capacity(wagon)
    end
  end

  def add_wagons_to_train(train_needed, wagons_needed, number_wagons)
    if train_needed.correct_type?(wagons_needed)
      @interface.wagon_number_added(number_wagons, train_needed_number) if train_needed.add_wagons(wagons_needed)
    else
      @interface.can_not_add_wagon
    end
  end

  def del_wagon_to_train
    number_train = @interface.create_train_menu
    number_wagon = @interface.number_wagon_remove
    train_needed = search_train_needed(number_train)
    if train_needed
      search_wagon_for_remove(train_needed, number_wagon)
    elsif !train_needed
      @interface.not_number_train
    else
      @interface.not_enter_anything
    end
  end

  def search_wagon_for_remove(train, number_wagon)
    wagon_needed = train.wagons.detect {|wagon| wagon.number == number_wagon}
    if wagon_needed
      @interface.wagon_removed if train.remove_wagon(wagon_needed)
    else
      @interface.no_wagon_number(number_wagon)
    end
  end

  def trains_information
    @trains.each do |train|
      unless train.route.nil?
        train.send_wagon_to_block do |wagon|
          @interface.detail_wagon(train, wagon)
        end
      end
    end
  end

  def station_information
    if stations.zero?
      @interface.none_stations
    else
      @stations.each do |station|
        @interface.name_station(station.name)
        station.send_train_to_block do |train|
          @interface.trains_at_stations(train)
        end
      end
    end
  end
end


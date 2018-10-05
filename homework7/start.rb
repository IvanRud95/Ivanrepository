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
    start_station_title = @interface.request_start_station_title
    end_station_title = @interface.request_end_station_title
    first_station = @stations.detect {|station| station.name == start_station_title}
    last_station = @stations.detect {|station| station.name == end_station_title}
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
    number_route = @interface.number_route - 1
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
    number_route = @interface.number_set("Route") - 1
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
      @interface.variant_choose
      create_train
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
    rescue RuntimeError => e
      puts e.inspect
      retry
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
    rescue RuntimeError => e
      puts e.inspect
      retry
    end
  end

  def check_train(number, type)
    @trains.any? {|train| train.number == number && train.type == type}
  end

  def look_trains
    if @trains.empty?
      @interface.not_trains_station
    else
      @trains.each {|train| @interface.trains_number_type(train.number, train.type)}
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
      @interface.set_route if train_needed.route_use(route_use)
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
      puts "Сurrent staion number #{number_train} #{current_station}"
      @interface.move_train
      move_train = gets.to_i
      if move_train == 1
        train_needed.move_forward
        @interface.move_train_forward
      elsif move_train == 2
        train_needed.move_back
        @interface.move_train_back
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
      when 5 then
        list_wagons_train
      else
        @interface.not_enter_anything
      end
    end
  end

  def create_wagon
    number = @interface.create_wagon_menu
    if number.zero?
      @interface.not_enter_anything
    elsif check_wagon_number(number)
      @interface.wagon_already
    else
      type = @interface.type_wagon
      case type
      when 1
        @interface.capacity_wagon
        capacity = gets.to_f
        @interface.cargo_wagon_created  if @wagons << CargoWagon.new(number, capacity)
      when 2
        @interface.count_seats_wagon
        count_seats = gets.to_i
        @interface.pass_wagon_created if @wagons << PassengerWagon.new(number, count_seats)
      end
    end
  end

  def check_wagons(number, type)
    @wagons.any? { |wagon| wagon.number == number && wagon.type == type && wagon.capacity == capacity }
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

  def add_wagon_to_train(train_needed, wagon_needed)
    if @interface.wagon_added
      if train_needed.add_wagon(wagon_needed)
      else
        @interface.can_not_add_wagon
      end
    end
  end

  def list_wagons_train
    if @trains.length == 0
      @interface.not_trains
    elsif @wagons.length == 0
      @interface.not_wagons
    else
      @trains.each do |train|
        @interface.list_wagons_train_title(train)
        train.wagons.each {|wagon| print wagon.number, " "}
        @interface.go
      end
    end
  end

  def buy_tiсket_train
    number_train = @interface.create_train_menu
    train_needed = search_train_needed(number_train)
    if check_train(number_train, "Cargo")
      @interface.train_created(train_needed)
    elsif train_needed
      check_for_ticket(train_needed)
    else
      @interface.not_number_train
    end
  end

  def check_for_ticket(train_needed)
    if train_needed.wagons.length != 0
      @interface.list_wagons_train_title(train_needed)
      train_needed.wagons.each {|wagon| print wagon.number, " "}
      @interface.go
      number_wagon = @interface.number_wagon
      wagon_needed = search_wagon_needed(number_wagon)
      check_wagon_for_ticket(wagon_needed)
    else
      @interface.no_wagon_number(train_number)
    end
  end

  def check_wagon_for_ticket(wagon_needed)
    if wagon_needed
      if wagon_needed.take_capacity
        @interface.buy_tiсket_title
      else
        @interface.no_tickets
      end
    else
      @interface.no_wagon
    end
  end

  def add_wagon_train
    number_train = @interface.create_train_menu
    train_needed = search_train_needed(number_train)
    if check_train(number_train,"Pass")
      @interface.number_train_passenger_title
    elsif train_needed
      check_add_wagon(train_needed)
    else
      @interface.not_number_train
    end
  end

  def check_add_wagon(train_needed)
    if train_needed.wagons.length != 0
      @interface.list_wagons_train(train_needed)
      train_needed.wagons.each {|wagon| print wagon.number, " "}
      @interface.go
      number_wagon = @interface.number_wagon
      wagon_needed = search_wagon_needed(number_wagon)
      add_wagon(wagon_needed)
    else
      @interface.wagon_not_add_title
    end
  end

  def add_wagon(wagon_needed)
    if wagon_needed
      value = @interface.add_wagon_title
      if wagon_needed.take_capacity(value)
        @interface.add_cargo
      else
        @interface.limit_capacity
      end
    else
      @interface.wagon_not_add_title
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
end



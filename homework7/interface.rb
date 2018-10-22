class Interface
  require_relative 'wagon.rb'

  def main_menu
    puts '1.Stations'
    puts '2.Routes'
    puts '3.Trains'
    puts '4.Wagons'
    puts '0.Exit'
    gets.to_i
  end

  def station_managment_menu
    puts '1.Create station'
    puts '2.Station List'
    puts '3.Delete station'
    puts '0.Exit'
    gets.to_i
  end

  def routes_managment_menu
    puts '1.Create Route'
    puts '2.Routes list'
    puts '3.Add station to the route'
    puts '4.Remove station from the route'
    puts '0.Exit'
    gets.to_i
  end

  def trains_managment_menu
    puts '1.Create train'
    puts '2.Train list'
    puts '3.Add route to the train'
    puts '4.Move train'
    puts '0.Exit'
    gets.to_i
  end

  def wagones_managment_menu
    puts '1.Create wagon'
    puts '2.Wagons list'
    puts '3.Buy ticket/ Take capacity'
    puts '4.Delete wagon from train'
    puts '5.Add wagon to train'
    puts '6.Wagons in train list'
    puts '7.Trains list at station'
    puts '0.Exit'
    gets.to_i
  end


  def get_answer
    gets.chomp
  end

  def not_item_menu
    puts 'There is no item in the menu.'
  end

  def create_station_menu
    puts 'Enter station name'
    gets.chomp
  end

  def create_train_menu
    puts "Enter train number "
    gets.chomp
  end

  def name_station(name)
    puts "Station :#{name}"
  end

  def stations_name_exist
    puts 'Station already exist'
  end

  def not_enter_anything
    puts 'You didnt enter anything'
  end

  def station_created
    puts 'Station has been created'
  end

  def none_stations
    puts 'There is no stations yet'
  end

  def remove_station_menu
    puts 'Enter station name for removing'
    gets.chomp
  end

  def not_station_for_remove
    puts 'There is no station for remove'
  end

  def station_removed
    puts 'Station has been deleted'
  end

  def look_trains_at_station_menu
    puts 'Enter station name'
    gets.chomp
  end

  def not_station_found
    puts 'Station was not found'
  end

  def not_trains_station
    puts 'There is no train in station'
  end

  def trains_at_stations(station_needed)
    station_needed.trains.each {|train| print train.number, " "}
    print "Trains at staion"
  end

  def check_stations_length
    puts 'You should created at least 2 stations'
  end


  def number_set(object_type)
    puts "Enter number #{object_type}"
    gets.to_i
  end

  def request_start_station_title
    puts 'Enter first station'
    gets.chomp
  end

  def request_end_station_title
    puts 'Enter last station'
    gets.chomp
  end

  def enter_wagon_number
    puts 'Enter wagon number'
  end

  def cargo_full
    puts 'cargo wagon is full'
  end

  def enter_train_type
    puts 'Enter wagon type'
    puts '1 - passenger'
    puts '2 - cargo'
    gets.to_i
  end

  def enter_wagon_type
    puts 'Enter wagon type'
    puts '1 - passenger'
    puts '2 - cargo'
    gets.to_i
  end

  def wagon_number_added(number_wagons, number_train)
    puts "Wagon number #{number_wagons} added to train #{number_train}"
  end

  def wagon_created(type,number,capacity)
    puts "#{type} wagon number #{number}, with volume/places #{capacity} created"
  end

  def show_wagon_details(number_wagon,type_wagon)
    puts "Wagon #{number_wagon} - #{type_wagon}"
  end

  def passenger_wagon_created(number)
    puts "The wagon has been created #{number}"
  end

  def cargo_wagon_created(number)
    puts "The wagon has been created #{number}"
  end

  def list_routes
    puts "Rotes list:"
  end

  def show_current_station_train(number_train, current_station)
    puts "Current station #{number_train} #{current_station}"
  end

  def show_move_forward_station
    puts "Train mooved forward"
  end

  def show_move_backward_station
    puts "Train mooved backward"
  end

  def show_trains_current_station(train)
    puts "Текущая станция для поезда #{train.number} #{train.current_station.name} "
  end

  def trains_move
    puts "1.Train moves forward"
    puts "2.Train moves backward"
    gets.to_i
  end

  def list_trains
    puts "Trains list:"
  end

  def route_created
    puts 'The route has been created'
  end

  def check_all_stations
    puts 'Station list checking'
  end

  def none_route
    puts 'The route dont exist'
  end

  def number_route
    puts "Route number "
  end

  def set_number_route
    puts "route number"
    gets.to_i
  end

  def routes_last
    puts "Enter fist station"
    gets.chomp
  end

  def routes_first
    puts "Enter last station"
    gets.chomp
  end

  def not_route
    puts 'This route dont exist'
  end

  def enter_name_station
    puts 'Enter station name to add it to the route'
    gets.chomp
  end

  def station_added
    puts 'Station has been added'
  end

  def name_remove_station
    puts 'You cant delete first and last station'
    puts 'Enter station name to remove'
    gets.chomp
  end


  def create_train
    puts "train has been created "
  end

  def enter_type
    gets.chomp
  end

  def buy_tiсket_title
    puts "Ticket has been bought"
  end

  def no_wagon
    puts "You dont have any wagons"
  end

  def no_tickets
    puts "Tickets are over"
  end

  def get_number(object_type)
    puts "Enter number for#{object_type}"
    gets.to_i
  end

  def go
    puts
  end

  def wagons_number_type(number, type)
    puts "#{number} - #{type}"
  end

  def show_wagon_type (number, type)
    puts "#{number} - #{type}"
  end

  def trains_by_type
    puts 'Enter train type: 1 - passenger, 2 - cargo'
    choise = gets.to_i
    case choise
    when 1
      'Passanger'
    when 2
      'Cargo'
    end
  end

  def list_wagons_train(train)
    print "Train number #{train.number}, has been added wagons: "
  end

  def wagon_not_add_title
    puts "Wagon with this number in not load to this train"
  end

  def train_created(train_number)
    puts "Train number #{train_number} has been created"
  end

  def add_wagon_title
    puts "Enter ammount for wagon load"
    gets.to_f
  end

  def add_cargo
    puts "Cargo has been add to the wagon"
  end

  def limit_capacity
    puts "You ask too much"
  end

  def number_train_passenger_title
    puts "This train is passenger"
  end

  def pass_train_ask
    puts "Пожалуйста введите три буквы или цифры в любом порядке, необязательный дефис и еще 2 буквы или цифры после дефиса."
  end

  def cargo_train_ask
    puts "Пожалуйста введите три буквы или цифры в любом порядке, необязательный дефис и еще 2 буквы или цифры после дефиса."
  end


  def variant_choose
    puts "Choose variants"
  end

  def train_exist
    puts "train already exist"
  end

  def not_trains
    puts 'There is no trains'
  end

  def train_type_choise_message
    puts "Please enter train type"
    puts "1. Passenger"
    puts "2. Cargo"
  end

  def list_created_routes
    puts 'Routes list'
  end

  def list_created_trains
    puts 'Trains list:'
  end

  def not_number_train
    puts 'Train with this number already exist'
  end

  def not_number_route
    puts 'Theris no rute with this number'
  end

  def set_route
    puts 'The route is set'
  end

  def move_train
    puts '1.Train goes forward'
    puts '2.Train goes back'
    gets.to_i
  end

  def move_train_forward
    puts "Train has been moved forward #{current_station}"
  end

  def move_train_back
    puts "Train has been moved back#{current_station}"
  end

  def create_wagon_menu
    puts 'Enter wagon name'
    gets.to_i
  end

  def type_wagon
    puts 'Put wagon type'
    puts '1.Cargo'
    puts '2.Passenger'
    gets.to_i
  end

  def not_wagons
    puts 'There is no wagons yet'
  end

  def number_wagon
    puts 'Enter wagon number'
    gets.to_i
  end

  def not_number_wagon
    puts 'There is no wagon with this number'
  end

  def only_cargo_passenger
    puts 'Only cargo wagon can be added'
    puts 'Only passanger wagon can be added'
  end

  def number_wagon_remove
    puts 'Enter wagon number to remove'
    gets.to_i
  end

  def cargo_wagon_already
    puts 'Cargo wagon with this number already exist'
  end

  def passenger_wagon_already
    puts 'Passenger wagon with this number already exist'
  end

  def can_not_add_wagon
    puts 'You cant add this wagon to the train'
  end

  def train_already_title
    puts 'Train with this number already exist'
  end

  def wagon_already
    puts 'Wagon with this number already exist'
  end

  def route_number
    puts 'Enter route number'
    gets.to_i
  end

  def pass_train_created(number)
    puts "Pass train number#{number} created"
  end

  def cargo_train_created(number)
    puts "Cargo train number#{number} created"
  end

  def list_wagons_train_title(train)
    print "Train number #{train.number}, added wagons: "
  end

  def route_number_added(number_route)
    print "Route #{number_route}: "
  end

  def puts_name
    puts
  end


  def wagon_added
    puts "Wagon number #{number_wagon} has been added #{train_needed.number}"
  end

  def wagon_removed
    puts puts "Wagon #{number_wagon} removed"
  end

  def no_wagon_number(number_train)
    puts "Theris no wagon with this number #{number_train} "
  end

  def station_for_train(number_train)
    puts "Station for train number #{number_train} #{current_station}"
  end

  def station_forward(current_station)
    puts "Train has been mooved forward #{current_station}"
  end

  def station_back(current_station)
    puts "Train has been mooved back #{current_station}"
  end

  def train_number_type(number, train)
    puts "#{number} - #{train}"
  end

  def free_capacity(wagon)
    puts " #{wagon.free_capacity} left"
  end

  def train_data
    print train.number, " "
  end

  def train_pass(number)
    puts "pass #{number} created"
  end

  def train_cargo(number)
    puts "cargo #{number} created"
  end

  def current_station(train)
    puts "Current station #{train.number} #{train.current_station.name} "
  end

  def route_number_display
    print "Route number #{number_route}: "
  end

  def input_route_numbre
    print "Enter route number: "
  end

  def enter_number (object_type)
    puts "Enter number #{object_type}"
    gets.to_i
  end

  def create_wagons
    puts 'Enter wagon name'
    gets.to_i
  end

  def pass_capacity
    puts "Enter amount of free places in wagon"
    gets.to_i
  end

  def cargo_capacity
    puts "Enter volume of cargo wagon"
    gets.to_i
  end

  def choose_wagon
    puts "Choose wagon"
    gets.to_i
  end

  def count_seats_wagon
    puts "Please enter ammount of seats"
  end

  def capacity_wagon
    puts "Please enter capacity for wagon"
  end

  def detail_wagon(train, wagon)
    if wagon.type == "Cargo"
      puts "Number train: #{train.number}, number wagon: #{wagon.number}, type: #{wagon.type}, capacity: #{wagon.capacity},
       take capacity: #{wagon.take_capacity}, free capacity: #{wagon.free_capacity}"
    else
      puts "Number train: #{train.number}, number wagon: #{wagon.number}, type: #{wagon.type},
       All places: #{wagon.capacity}, take : #{wagon.take_capacity}, free: #{wagon.free_capacity}"
    end
  end

end
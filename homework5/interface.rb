class Interface
  attr_reader :routes_list



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
    puts '3.Add wagon to train'
    puts '4.Exit'
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

  def stations_name_exist
    puts 'Station already exist'
  end

  def not_enter_anything
    puts 'You didnt enter anything'
  end

  def station_created
    puts 'Station has been created'
  end

  def none_stationas
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

  def trains_at_station
    print 'Trains on station list'
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

  def enter_wagon_type
    puts 'Enter wagon type'
    puts '1 - passenger'
    puts '2 - cargo'
  end


  def wagon_created
    puts 'The wagon has been created'
  end

  def pass_wagon_created
    puts 'The wagon has been created'
  end

  def cargo_wagon_created
    puts 'The wagon has been created'
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
    puts 'Enter route number'
    gets.to_i
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

  def create_train_menu
    puts 'Enter train number'
    gets.to_i
  end

  def create_train
    puts "train has been created "
  end

  def enter_type
    gets.chomp
  end

  def go
    puts
  end

  def trains_by_type
    puts 'Enter train type: 1 - passenger, 2 - cargo'
    gets.to_i
  end

  def train_pass_created(number)
    puts "Passenger train #{number} has been created"
  end

  def train_cargo_created(number)
    puts "Cargo train #{number} has been created"
  end

  def not_trains
    puts 'There is no trains'
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

  def show_wagon_type(wagon_number, wagon_type)
    puts "Wagon #{wagon_number} - #{wagon_type}"
  end

  def route_number
    puts 'Enter route number'
    gets.to_i
  end

  def route_number_added(number_route)
    print "Route #{number_route}: "
  end

  def puts_name
    puts
  end

  def wagon_added
    puts "Wagon number #{number_vagon} has been added #{train_needed.number}"
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

  def station_forward
    puts "Train has been mooved forward #{current_station}"
  end

  def station_back
    puts "Train has been mooved back #{current_station}"
  end

  def train_number_type(number_train, train_type)
    puts "#{number_train} - #{train_type}"
  end

  def train_data
    print train.number, " "
  end

  def train_pass(number)
    puts "pass #{number} "
  end

  def train_cargo(number)
    puts "cargo #{number} "
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

  def create_wagons
    puts 'Enter wagon name'
    gets.to_i
  end
end


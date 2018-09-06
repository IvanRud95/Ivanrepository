Class Interface

   def main_menu
     puts "1.Stations"
     puts "2.Routes"
     puts "3.Trains"
     puts "4.Wagons"
     puts "0.Exit"
     gets.to_i
   end

  def stations_managment_menu
    puts "1.Create station"
    puts "2.Station List"
    puts "3.Delete station"
    puts "4.Train list on station"
    puts "0.Exit"
    gets.to_i
  end

  def create_station_menu
    puts "Enter station name"
    gets.chomp
  end

  def stations_name_taken
    puts "Station already exist"
  end

  def not_enter_anything
    puts "You didnt enter anything"
  end

  def station_created
    puts "Station has been created"
  end

  def none_stationas
    puts "There is no stations yet"
  end

  def remove_station_menu
    puts "Enter station name for removing"
    gets.chomp
  end

  def not_station_for_remove
    puts "There is no station for remove"
  end

  def station_removed
    puts "Station has been deleted"
  end

  def look_trains_at_station_menu
    puts "Enter station name"
    gets.chomp
  end

  def not_station_found
    puts "Station was not found"
  end

  def not_trains_station
    puts "There is no train in station"
  end

  def trains_at_station
    print "Trains on station list"
  end

  def check_stations_length
    puts "You should created at least 2 stations"
  end

  def routes_managment_menu
    puts "1.Create route"
    puts "2.Routes list"
    puts "3.Add station at the route"
    puts "4.Remove station at the route"
    puts "0.Exit"
    gets.to_i
  end

  def request_start_station_title
    puts "Enter first station"
    gets.chomp
  end

  def request_end_station_title
    puts "Enter last station"
    gets.chomp
  end

  def route_created
    puts "The route has been created"
  end

  def check_all_stations
    puts "Station list checking"
  end

  def none_route
    puts "The route dont exist"
  end

  def number_route
    puts "Enter route number"
    gets.to_i
  end

  def not_route
    puts "This route dont exist"
  end

  def enter_name_station
    puts "Enter station name to add it to the route"
    name = gets.chomp
  end

  def station_added
    puts "Station has been added"
  end

  def name_remove_station
    puts "You cant delete first and last station"
    puts "Enter station name to remove"
    gets.chomp
  end

  def trains_managment_menu
    puts "1.Create train"
    puts "2.Train list"
    puts "3.Add route to the train"
    puts "4.Replace train"
    puts "0.Exit"
    gets.to_i
  end

  def create_train_menu
    puts "Enter train number"
    gets.to_i
  end

  def option_type_train
    puts "Enter train type: 1 - passenger, 2 - cargo"
    gets.to_i
  end

  def not_trains
    puts "There is no trains"
  end

  def list_created_routes
    puts "Routes list"
  end

  def list_created_trains
    puts "Trains list:"
  end

  def not_number_train
    puts "Train with this number already exist"
  end

  def not_number_route
    puts "Theris no rute with this number"
  end

  def set_route
    puts "The route is set"
  end

  def move_train
    puts "1.Train goes forward"
    puts "2.Train goes back"
  end

  def wagons_managment_menu
    puts "1.Create wagon"
    puts "2.Wagons list"
    puts "3.Add wagon to train"
    puts "4.Remove wagon"
    puts "0.Exit"
    gets.to_i
  end

  def create_wagon_menu
    puts "Create wagon menu"
    gets.to_i
  end

  def type_wagon
    puts "Put wagon type"
    puts "1.Cargo"
    puts "2.Passenger"
    gets.to_i
  end

  def not_wagons
    puts "Theris no wagons yet"
  end

  def number_wagon
    puts "Enter wagon number"
    gets.to_i
  end

  def not_number_wagon
    puts "There is no wagon with this number"
  end

  def only_cargo_passenger
    puts "Only cargo wagon can be added"
    puts "Only passanger wagon can be added"
  end

  def number_wagon_remove
    puts "Enter wagon number to remove"
    gets.to_i
  end

  def cargo_wagon_already
    puts "Cargo wagon with this number already exist"
  end

  def passenger_wagon_already
    puts "Passenger wagon with this number already exist"
  end

  def can_not_add_wagon
    puts "You cant add this wagon to the train"
  end

  def train_already_title
    puts "Train with this number already exist"
  end

  def wagon_already
    puts "Wagon with this number already exist"
  end

end

end

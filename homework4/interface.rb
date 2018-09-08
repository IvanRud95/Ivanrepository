class Interface

  MENU = {
    :menu
     1=> "Stations",
     2=> "2.Routes",
     3=> "3.Trains",
     4=> "4.Wagons",
     0=> "0.Exit"
   },
    :stations => {
     1 => "Create station",
     2 => "Station List",
     3 => "Delete station",
     4 => "Train list on station",
     0 => "Exit"
   },
   :routes => {
     1 => "Create Route",
     2 => "Rutes list",
     3 => "Add station to the route",
     4 => "Remove station from the route",
     5 => "Exit"
   },
     :trains => {
      1 => "Create train",
      2 => "Train list",
      3 => "Add route to the train",
      4 => "Move back by route",
      5 => "Exit",\

      :wagons => {
      1 => "Create wagon",
      2 => "Wagons list",
      3 => "Add wagon to train",
      4 => "Exit"
     }
   }
        
    def menu(type)
       MENU[type].each {|key, value| puts "#{key}: #{value}"}
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

   def stations_name_exist
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

   def create_wagon_menu
     puts "Enter wagon name"
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

   def create_train_type(number, type)
      if type == "cargo"
        @trains_list << CargoTrain.new(number)
      elsif type == "pass"
        @trains_list << PassTrain.new(number)
      else
        puts "Error, you must enter 'cargo' or 'pass'!"
      end
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

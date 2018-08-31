Class Interface

  def initialize
    @interface_menu = Interface.new
  end

puts "Lets create Railroad."

attr_reader :stations, :trains, :routes, :wagons

 def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []

  def display_station(station)
    puts "list of stations"
    @stations.each { |station| puts station.name }
  end

loop do
   puts '1. Create Station'
   puts '2. Create Train'
   puts '3. Create Route'
   puts '4. Give route to train'
   puts '5. Add wagon'
   puts '6. Less wagon'
   puts '7. Train to route '
   puts '0. Exit'
   puts 'Choose variate: '
    input = gets.to_i
  break if input.zero?

  if input == 1
    puts 'Put name of the station'
    station_name = gets.chomp
    station_variable = Station.new(station_name)
    @stations.push(station_variable)
  end

  if input == 2

    def create_train_type(number, type)
      if type == "cargo"
        @trains_list << CargoTrain.new(number)
      elsif type == "pass"
        @trains_list << PassangerTrain.new(number)
      else
        puts "Error, you must enter 'cargo' or 'pass'!"
      end
    end

   if input == 3
    puts 'Put name of first and last station'
     first_station = gets.chomp
     last_station = gets.chomp
     detect_first_station = @stations.detect { |station| station.name == first_station }
     detect_last_station = @stations.detect { |station| station.name == last_station }
     route = Route.new(detect_first_station, detect_last_station)
     routes.push(route)
   end

   if input == 4
       puts 'Put train number'
       input_train_number = gets.chomp
       puts 'Put route number'
       input_route_number = gets.to_i

       choosen_train = all_trains.detect { |train| train.number == input_train_number }
       choosen_train.receive_train_trace_list(all_routes[input_route_number - 1].output)

    if input == 7
           puts 'Put train numer'
           input_train_number = gets.chomp
           go_back = gets.chomp

           choosen_train = trains.detect { |train| train.number == input_train_number }
           if go_back == '1'
             choosen_train.go
           else
             choosen_train.back
           end
     end
 end

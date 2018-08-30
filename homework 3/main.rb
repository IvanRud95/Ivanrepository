require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_wagon.rb'
require_relative 'cargo_wagon.rb'

puts "Lets create Railroad."
  @stations = []
  trains = []
  routes = []

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
    begin
      puts 'Put train number'
      train_number = gets.chomp
      puts '1. Train cargo'
      puts '2. Train passanger'
      input_train = gets.chomp
      train_variable = if input_train == '1'
                         CargoTrain.new(train_number)
                       else
                         PassengerTrain.new(train_number)
                       end
      trains.push(train_variable)
      puts "Train #{train_variable.number} has been created, train type #{train_variable.type}"
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

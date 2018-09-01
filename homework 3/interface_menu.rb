Class Interface

  def base_menu
      puts "1.Stations"
      puts "2.Routes"
      puts "3.Trains"
      puts "4.Wagons"
      puts "0.Exit"
      gets.to_i
    end
    def mistake_menu
      puts "Error"
    end

    def stations_menu
      puts "1.Create station"
      puts "2.Station list"
      puts "3.Delete station"
      puts "4.Train list"
      puts "0.Exit"
      gets.to_i
    end

    def create_station_menu
      puts "Put station name"
      gets.chomp
    end

    def stations_name_exist
      puts "Station name already exist"
    end

    def create_station
      puts "Station has been created"
    end


    def remove_station_menu
      puts "Put station"
      gets.chomp
    end

    def no_station_for_delete
      puts "No station for remove"
    end

    def station_delete
      puts "Station deleted"
    end

    def trains_at_station_menu
      puts "Put station name"
      gets.chomp
    end

    def station_no_exist
      puts "This station dont exist"
    end

    def input_anything
      puts "You dont put anything"
    end

    def station_created
      puts "Station has been created"
    end

    def station_deleted
      puts "Station has been deleted"
    end

    def routes_managment_menu
    puts "1.Create route"
    puts "2.Look for routes"
    puts "3.Add stationm to route"
    puts "4.Delete station"
    puts "0.exit"
    gets.to_i
  end

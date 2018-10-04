require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'validation'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation
  attr_reader :type, :wagons, :route, :number, :speed, :current_station_index
  @@all_trains = {}
  NUMBER_FORMAT = /^(\d|[a-z1-9]){3}-?(\d|[a-z1-9]){2}$/i

  def find(train_number)
    all_trains[train_number]
  end

  def self.all_instances
    @@all_trains
  end

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @@all_trains[number] = self
    @interface = Interface.new
    register_instances
    validate!
  end

  protected

  def validate!
    raise "You didnt put anything" if number.nil?
    raise "You didnt choose type of the train" if type.nil?
    raise "Incorrect format number " if number !~ NUMBER_FORMAT
  end

  public

  def add_speed
    @speed += 1
  end

  def low_speed
    @speed -= 1 if speed != 0
  end

  def add_wagon
    @wagons += 1 if @speed.zero?
  end

  def remove_wagon
    if @speed.zero? && @wagons > 0
      @wagons -= 1
    end
  end

  def add_route(route)
    @route = route
    route.first_station.add_train(self)
    @station_index = 0
  end

  def move_forward
    if next_station
      current_station.send_train(self)
      next_station.add_train(self)
      @index_station += 1
    end
  end

  def route_use(route)
    @route = route
    @current_station_index = 0
    route.first_station.add_train(self)
  end

  def move_back
    if previous_station
      current_station.send_train(self)
      previous_station.add_train(self)
      @index_station -= 1
    end
  end

  def current_station
    route.stations[@current_station_index]
  end

  def previous_station
    route.stations[@current_station_index - 1] if @current_station_index > 0
  end

  def next_station
    route.stations[@current_station_index + 1] if @current_station_index < route.stations.length - 1
  end

  def train_number_type
    @interface.train_number_type(@number, @type)
  end

  def send_wagon_to_block
    @wagons.each {|wagon| yield wagon}
  end

end

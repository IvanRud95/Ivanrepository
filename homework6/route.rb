require_relative 'instance_counter'
require_relative 'validation_error'

class Route
  include InstanceCounter
  include Validation
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    register_instances
    validate!
  end

  public

  def add_station(station)
    @stations.insert(-2, station)
  end

  def display_station
    stations.each {|station| print station.name, " "}
  end

  def del_station(station)
    if first_station != station && last_station != station
      @stations.delete(station)
    end
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end

  private

  def validate!
    raise "This start station didnt exist" unless first_station.kind_of? Station
    raise "This end station didnt exist" unless last_station.kind_of? Station
    raise "First and last stations should be different" if first_station == last_station
  end
end

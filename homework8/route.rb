require_relative 'instance_counter'
require_relative 'validation'

class Route

  include InstanceCounter
  include Validation
  attr_reader :stations, :start_station, :end_station

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    register_instances
    validate!
  end

  private

  def validate!
    raise 'This start station didnt exist' unless first_station.is_a? Station
    raise 'This end station didnt exist' unless last_station.is_a? Station
    raise 'First and last stations should be different' if first_station == last_station
  end

  public

  def add_station(station)
    @stations.insert(-2, station)
  end

  def display_station
    stations.each { |station| print station.name, ' ' }
  end

  def del_station(station)
    @stations.delete(station)
    unless [stations.first, stations.last].include?(station)
    end
  end

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end

end

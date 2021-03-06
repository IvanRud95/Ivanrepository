require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :trains, :name

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations.push(self)
    register_instances
  end

  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def all_trains
    trains.each { |train| puts "#{train.number} #{train.type}" }
  end

  def trains_by_type(type)
    @trains.select {|train| train.type == type}
  end

end

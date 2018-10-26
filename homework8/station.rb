require_relative 'instance_counter'
require_relative 'validation'

class Station

  include InstanceCounter
  include Validation
  attr_reader :trains, :name

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instances
    validate!
  end


  private

  def validate!
    raise "You must enter station name!" if name.nil? || name.empty?
  end

  public

  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def all_trains
    trains.each {|train| puts "#{train.number} #{train.type}"}
  end


  def trains_by_type(type)
    @trains.select {|train| train.type == type}
  end

  def send_train_to_block
    @trains.each {|train| yield train}
  end

end
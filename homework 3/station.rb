class Station

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def delete_train(train)
    @trains.delete(train) { |train| "Train #{train} not found" }
  end

  def trains_list(type = :all)
    @trains.select { |train| train.type == type || type == :all}   
  end

end

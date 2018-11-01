# instance_counter
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethods
    protected

    def register_instances
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
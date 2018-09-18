module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include
  end

  module ClassMethods
    def instances
      @counter ||= 0
    end
    def instances=(value)
      @counter = value
    end
  end
module Validation

  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name_attr, type_valid, *args)
      @validates ||= []
      @valid = {}
      @valid[name_attr] = {type: type_valid, args: args}
      @validates << @valid
    end
  end

  module InstanceMethods

    private

    def validate!
      self.class.instance_variable_get('@validates').each do |rule|
        rule.each do |name, params|
          send("validate_#{params[:type]}", instance_variable_get("@#{name}"), params[:args])
        end
      end
    end


    def valid?
      if validate!
        true
      else
        false
      end
    end


    def presence(value)
      unless value.nil? || value == ''
        raise "Value can't be blank"
      end
    end

    def format(value, args)
      if value.is_a?(String)
        raise 'Wrong value' unless value.empty?
      end
    end

    def type(value, args)
      raise 'Wrong type' unless value.is_a? args[0]
    end

    def positive(value, args)
      raise 'Negative value' if value.to_s !~ args[0]
    end
  end
end


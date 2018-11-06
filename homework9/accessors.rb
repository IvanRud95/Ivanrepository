module Acсessors

  def attr_accessor_with_history(*methods)
    methods.each do |method|
      raise TypeError, 'method name  is not  symbol' unless method.is_a?(Symbol)
      define_method(method) do
        instance_variable_get("@#{method}")
      end
      define_method("#{method}=") do |value|
        story_variable = "@#{method}_history"
        value_now = instance_variable_get("@#{method}")
        instance_variable_set(story_variable, []) if instance_variable_get(story_variable).nil?
        if instance_variable_set("@#{method}", value) && !value_now.nil?
          instance_variable_get(story_variable) << value_now
        end
      end
      define_method("#{method}_history") {p instance_variable_get("@#{method}_history")}
    end
  end

  def strong_attr_accessor(method, type_class)
    raise TypeError, 'method name  is not symbol' unless method.is_a?(Symbol)
    define_method(method) do
      instance_variable_get("@#{method}")
    end
    define_method("#{method}=") do |value|
      raise 'For the set is not that type' unless value.is_a?(type_class)
      instance_variable_set("@#{method}", value)
    end
  end
end

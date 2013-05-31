module ValueObjectAR
  module Methods
    extend ActiveSupport::Concern

    module ClassMethods
  
      def value_object(attribute, klass)
        class_eval do
          define_value_object_ar_reader(attribute, klass)
          define_value_object_ar_writer(attribute, klass)
        end
      end
  
    private
      
      def define_value_object_ar_reader(attribute, klass)
        define_method(attribute.to_s) do
          klass.new(attributes[attribute.to_s])
        end
      end
    
      def define_value_object_ar_writer(attribute, klass)
        define_method("#{attribute}=") do |value|
          if value.is_a?(klass) 
            value = value.send(attribute)
          end
          attributes[attribute.to_s] = value
        end
      end
    
    end
  end
end
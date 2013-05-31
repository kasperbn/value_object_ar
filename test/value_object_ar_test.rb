require "test/unit"
require_relative "../lib/value_object_ar"

class TestValueObjectAr < Test::Unit::TestCase

  def setup
    @product = Product.new(currency: 'DKK')
  end

  def test_call_methods_on_value_object
    assert_equal @product.currency.hipstier_than_bitcoin?, "DKK? Probably not"
  end
  
  def test_set_with_value
    @product.currency = 'EUR'
    assert_equal @product.currency.hipstier_than_bitcoin?, "EUR? Probably not"
  end
  
  def test_set_with_value_object
    @product.currency = CurrencyValueObject.new('USD')
    assert_equal @product.currency.hipstier_than_bitcoin?, "USD? Probably not"
  end

end

class CurrencyValueObject
  
  attr_accessor :value
  
  def initialize(value)
    @value = value
  end
  
  def hipstier_than_bitcoin?
    "#{value}? Probably not"
  end
  
end

class Product
  
  include ValueObjectAR::Methods
  value_object :currency, CurrencyValueObject

  # ActiveRecord behaviour below:
  attr_accessor :attributes
    
  def initialize(options={})
    options.each {|k,v| self.public_send("#{k}=",v)}
  end
  
  def attributes
    @attributes ||= {'currency' => nil}
  end
  
end

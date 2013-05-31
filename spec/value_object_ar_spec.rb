require_relative "../lib/value_object_ar"

describe "ValueObjectAr" do

  before(:each) do
    @product = Product.new(currency: 'DKK')
  end

  it 'should call methods on value object' do
    @product.currency.hipstier_than_bitcoin?.should == "DKK? Probably not"
  end
  
  it 'should set with value' do
    @product.currency = 'EUR'
    @product.currency.hipstier_than_bitcoin?.should == "EUR? Probably not"
  end
  
  it 'should set with value object' do
    @product.currency = Currency.new('USD')
    @product.currency.hipstier_than_bitcoin?.should == "USD? Probably not"
  end
  
end

class Currency
  
  attr_accessor :currency
  
  def initialize(currency)
    @currency = currency
  end
  
  def hipstier_than_bitcoin?
    "#{currency}? Probably not"
  end
  
end

class Product
  
  include ValueObjectAR::Methods
  value_object :currency, Currency

  # ActiveRecord behaviour below:
  attr_accessor :attributes
    
  def initialize(options={})
    options.each {|k,v| self.public_send("#{k}=",v)}
  end
  
  def attributes
    @attributes ||= {'currency' => nil}
  end
  
end

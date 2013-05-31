require_relative "../../lib/value_object_ar"

describe "ValueObjectAr" do

  it 'should behave as a value object' do
    p = Product.new(currency: 'dkk')
    p.currency.hipstier_than_bitcoin?.should == "probably not"
  end
  
end

class Currency
  
  attr_accessor :currency, :answer
  
  def initialize(currency)
    @currency = currency
  end
  
  def hipstier_than_bitcoin?
    "probably not"
  end
  
end

class Product
  
  include ValueObjectAR::Methods
  value_object :currency, Currency  

  # ActiveRecord behaviour below:
  attr_accessor :currency  
  attr_accessor :attributes
    
  def initialize(options={})
    options.each {|k,v| self.public_send("#{k}=",v)}
  end
  
  def attributes
    {'currency' => nil}
  end
  
end

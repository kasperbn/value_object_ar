# Value Object AR

[![Build Status](https://travis-ci.org/kasperbn/value_object_ar.png)](https://travis-ci.org/kasperbn/value_object_ar)

Value objects for your active models. Conveniently, set your attributes either by value or value object.

## Installation

from command line

    gem install value_object_ar
    
or in bundler

    gem 'value_object_ar'

## Usage

Wrap a value in a class like this:

    class Product < ActiveRecord::Base
      value_object :currency, Currency
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
    
Call the methods of `Currency` like this:

    product = Product.new(currency: 'DKK')
    product.currency.hipstier_than_bitcoin? # => "DKK? Probably not"

Set `product.currency` either by value:

    product.currency = 'EUR'
    product.currency.hipstier_than_bitcoin? # => "EUR? Probably not"
    
.. or by value object:
  
    product.currency = Currency.new('USD')
    product.currency.hipstier_than_bitcoin? # => "USD? Probably not"
  
## Licence

MIT Licence

## Author

Kasper Bjørn Nielsen (kasperbn@gmail.com)
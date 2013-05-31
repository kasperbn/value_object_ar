require 'active_support'
require 'active_record'
require 'methods'

ActiveRecord::Base.send(:include, ValueObjectAR::Methods)
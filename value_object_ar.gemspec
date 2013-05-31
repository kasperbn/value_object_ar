Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'value_object_ar'
  s.version     = '0.0.2'
  s.summary     = 'Value objects for your active models'
  s.author    = 'Kasper Bjørn Nielsen'
  s.email     = 'kasperbn@gmail.com'
  s.homepage  = 'http://github.com/kasperbn/value_object_ar'

  s.require_paths << 'lib'
  s.files       = Dir["lib/**/*"]
  s.test_files  = Dir["test/**/*_test.rb"]

  s.add_dependency 'activerecord'
  s.add_development_dependency 'rake'
end
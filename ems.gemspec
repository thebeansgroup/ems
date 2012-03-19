# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'ems/version'

Gem::Specification.new do |s|
  s.name        = "ems"
  s.version     = Ems::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vincent Siebert"]
  s.email       = ["vincent@thebeansgroup.com"]
  s.homepage    = "http://github.com/thebeansgroup/ems"
  s.summary     = "Editorial Management System"
  s.description = "The EMS"

  s.required_rubygems_version = ">= 1.9.6"
  s.rubyforge_project         = "ems"

  s.add_dependency 'batman-rails'
  s.add_dependency "jquery-rails"
  s.add_dependency "friendly_id"
  s.add_dependency 'mysql2'
  s.add_dependency 'devise'
  s.add_dependency 'haml'
  s.add_dependency 'json'

  s.add_development_dependency  'spork'
  s.add_development_dependency  'rspec-rails'
  s.add_development_dependency  'cucumber-rails'
  s.add_development_dependency  'database_cleaner'


  #s.files        = Dir.glob("{bin,lib}/**/*") + %w(MIT-LICENSE README.md CHANGELOG.md)
  s.files = Dir["README.md", "MIT-LICENSE", "lib/**/*.rb"]
  s.require_path = 'lib'
end
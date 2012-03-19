$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ems/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ems"
  s.version     = Ems::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vincent Siebert"]
  s.email       = ["vincent@thebeansgroup.com"]
  s.homepage    = "http://github.com/thebeansgroup/ems"
  s.summary     = "Editorial Management System"
  s.description = "TODO: Description of Ems."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
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
end
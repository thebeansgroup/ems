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
  s.description = "Editorial Management system used within group projects"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "jquery-rails"
  s.add_dependency "batman-rails"
  s.add_dependency "friendly_id"
  s.add_dependency "mysql2"
  s.add_dependency "json"
  s.add_dependency "paperclip"
  s.add_dependency "aws-sdk"
  s.add_dependency "sunspot_rails"
  s.add_dependency "devise"
  s.add_dependency "cancan"
  s.add_dependency "paperclip"
  s.add_dependency "aws-sdk"
  s.add_dependency "squeel"
  s.add_dependency "sanitize"
  s.add_dependency "wmd-rails"
  s.add_dependency "simple_form"
  s.add_dependency "simple-navigation"
  
end
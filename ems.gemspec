$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ems/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ems"
  s.version     = Ems::VERSION
  s.authors     = ["Vincent Siebert"]
  s.email       = ["vincent@thebeansgroup.com"]
  s.homepage    = "http://www.thebeansgroup.com"
  s.summary     = "TODO: Summary of Ems."
  s.description = "TODO: Description of Ems."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end

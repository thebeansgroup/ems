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

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "ems"

  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(MIT-LICENSE README.md CHANGELOG.md)
  s.require_path = 'lib'
end
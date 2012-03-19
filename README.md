# EMS - Editorial Management System

The EMS is a management system that can be used as an engine for any blog or website rolled out on Rails.

## Architecture

As mentioned before, the EMS is contained within a mountable engine.

### Installation:

To install the EMS simply follow these steps:

1.  include the EMS as a dependency in your Gemfile:
`gem 'ems', :git => 'git://github.com/thebeansgroup/ems.git'`

2.  mount the engine in your applications `config/routes.rb`
`mount Ems::Engine => "/ems"`

3.  install the engines migrations:
`rake ems:install:migrations`
# EMS - Editorial Management System

The EMS is a management system that can be used as an engine for any blog or website rolled out on Rails.

## Architecture

As mentioned before, the EMS is contained within a mountable engine. For more information on mountable engines please
visit http://guides.rubyonrails.org/engines.html

### Authentication and Ability management
Authentication within the EMS is handled by Devise. Devise is a dependency for the EMS however the engine iself has no
working knowlege of how the authentication works, this is completely up to the parent app.
Abilities within the EMS are currently defined as:

* Editor
* Author

The editor is the only ability with which you can post publications. The author is only able to curate and draft
publications. The actual task of setting these live is left to the Editor. This enables the editor to review any content
about to go live.

### Installation:

To install the EMS simply follow these steps:

1.  include the EMS as a dependency in your Gemfile:
`gem 'ems', :git => 'git://github.com/thebeansgroup/ems.git'`

2.  mount the engine in your applications `config/routes.rb`
`mount Ems::Engine => "/ems"`

3.  install the engines migrations:
`rake ems:install:migrations`
source "http://rubygems.org"

# Declare your gem's dependencies in ems..gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"
# adding batman with rails
gem 'batman-rails'
# adding friendly id for sluggable
gem "friendly_id"
# using mysql as db
gem 'mysql2'
# Using devise for authentication
gem 'devise'
# using HAML
gem 'haml'
# getting json
gem 'json'

# Declare any dependencies that are still in development here instead of in
# your .gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your .gemspec before releasing
# your gem to rubygems.org.

group :assets do
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
end

group :development, :test do
  gem 'spork'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'database_cleaner'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

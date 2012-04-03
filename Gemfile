source "http://rubygems.org"

# Declare your gem's dependencies in ems..gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem "jquery-rails"
gem 'batman-rails'
gem "friendly_id"
gem 'mysql2'
gem 'haml'
gem 'json'
gem 'cancan'
gem 'kramdown'

# Declare any dependencies that are still in development here instead of in
# your .gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your .gemspec before releasing
# your gem to rubygems.org.

group :development, :test do
  gem  'growl'
  gem 'spork'
  gem 'jasmine'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'database_cleaner'
end

group :development do
  gem 'kss-rails'
  gem 'guard'
  gem 'guard-rails'
  gem 'foreman'
end

group :assets do
  gem "haml"
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

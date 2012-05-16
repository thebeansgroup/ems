source "http://rubygems.org"

# Declare your gem's dependencies in ems..gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem "jquery-rails"
gem "friendly_id"
gem 'mysql2'
gem 'haml'
gem 'json'
gem 'cancan'
gem 'kramdown', :git => 'git://github.com/thebeansgroup/kramdown.git', :branch => 'bean-kramdown'
gem "paperclip"
gem "aws-sdk"
gem 'sunspot_rails'
gem 'sanitize'

# Declare any dependencies that are still in development here instead of in
# your .gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your .gemspec before releasing
# your gem to rubygems.org.

group :development, :test do
  gem 'growl'
  gem 'foreman'
  gem 'guard'
  gem 'guard-rails', :git => 'git://github.com/thebeansgroup/guard-rails.git', :branch => 'engine-support'
  # gem 'guard-jasmine'
  gem 'guard-coffeescript'
  gem 'guard-livereload'
  gem 'spork'
  gem 'jasmine'
  # gem 'jasminerice'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'kss-rails'
  gem 'sunspot_solr'
  gem 'progress_bar'
  gem 'haml-rails'
end

group :assets do
  gem "haml"
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
  gem 'bourbon', '~> 2.0.0.rc1'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

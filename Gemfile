source "http://rubygems.org"

# Declare your gem's dependencies in pixelator.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"
gem 'haml'
gem 'uglifier' #needed for testing the asset pipeline

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'jasmine', git: 'git://github.com/pivotal/jasmine-gem.git'
end

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

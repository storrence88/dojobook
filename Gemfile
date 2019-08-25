# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby/Rails
ruby '2.6.3'
gem 'rails', '~> 6.0.0'

# API/Server
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 3.11'

# Assets
gem 'sass-rails', '~> 5'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

# Authentication
gem 'devise'

# Background Processing
gem 'redis'
gem 'sidekiq'

# CI Testing
gem 'brakeman', require: false
gem 'rubocop', require: false
gem 'rubycritic', require: false

# Database
gem 'hookup'
gem 'pg', '>= 0.18', '< 2.0'

# Pagination
gem 'kaminari'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Debugging
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'

  # Annotation
  gem 'annotate'

  # Coverage
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'simplecov-summary'

  # Doumentation
  gem 'yard'

  # Emails
  gem 'letter_opener_web', '~> 1.0'

  # Error Display
  gem 'better_errors'
  gem 'binding_of_caller'

  # Fake Data
  gem 'factory_bot_rails'
  gem 'faker'

  # Tests
  gem 'capybara'
  gem 'database_cleaner'
  gem 'fivemat'
  gem 'formulaic'
  gem 'rspec-rails'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.6'

# Core Rails framework
gem 'rails', '~> 7.2.2'

# Database
gem 'sqlite3', '>= 2.1'

# Server
gem 'puma', '>= 6.0'

# Asset pipeline & JavaScript
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'sprockets-rails'

# CSS & UI
gem 'sassc-rails'
gem 'bootstrap', '~> 5.3'

# Application-specific gems
gem 'bcrypt', '~> 3.1.7'
gem 'faker', '~> 3.0'
gem 'city-state'
gem 'pagy', '~> 9.0'

# Performance
gem 'bootsnap', require: false

# JSON
gem 'jbuilder'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw], require: 'debug/prelude'
  gem 'rspec-rails', '~> 7.0'
  gem 'factory_bot_rails', '~> 6.4'
  gem 'rubocop', '~> 1.69', require: false
  gem 'rubocop-rails', '~> 2.27', require: false
  gem 'rubocop-rspec', '~> 3.2', require: false
  gem 'rubocop-performance', '~> 1.23', require: false
end

group :development do
  gem 'web-console'
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
  gem 'bundle-audit', '~> 0.1.0'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw x64_mingw mswin jruby]

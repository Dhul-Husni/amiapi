# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'friendly_id', '~> 5.4.0'
gem 'jwt'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.1'
gem 'simple_command'
gem 'sqlite3', '~> 1.4'

# static code analyzer
gem 'rubocop', '~> 0.92.0', require: false
gem 'rubocop-minitest', '~> 0.9.0', require: false
gem 'rubocop-performance', '~> 1.6.1', require: false
gem 'rubocop-rails', '~> 2.6.0', require: false

group :development, :test do
  gem 'pry'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'codecov', require: false
  gem 'minitest-ci'
  gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'simplecov', require: false
  gem 'webmock'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

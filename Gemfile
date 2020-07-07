# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activesupport', '~> 6.0'
gem 'http', '~> 4.3'
gem 'oj', '~> 3.10'
gem 'pagy', '~> 3.7'
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.3'
gem 'rack-cors', '~> 1.1'
gem 'rake', '~> 13.0'
gem 'require_all', '~> 3.0'
gem 'sidekiq', '~> 6.0'
gem 'sinatra', '~> 2.0'
gem 'sinatra-activerecord', '~> 2.0'
gem 'sinatra-contrib', '~> 2.0'

group :development do
  gem 'rubocop', '~> 0.87'
  gem 'rubocop-performance', '~> 1.5'
  gem 'rubocop-rspec', '~> 1.38'
end

group :test do
  gem 'database_cleaner', '~> 1.8'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.9'
  gem 'shoulda-matchers', '~> 4.3'
  gem 'simplecov', '~> 0.18', require: false
  gem 'vcr', '~> 5.1'
  gem 'webmock', '~> 3.8'
end

group :development, :test do
  gem 'bundler-audit', '~> 0.6'
  gem 'byebug', '~> 11.1'
  gem 'dotenv', '~> 2.7'
  gem 'factory_bot', '~> 5.1'
  gem 'faker', '~> 2.10'
  gem 'strong_migrations', '~> 0.6'
end

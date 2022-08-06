# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activesupport', '~> 7.0'
gem 'http', '~> 5.1'
gem 'oj', '~> 3.13'
gem 'pagy', '~> 5.10'
gem 'pg', '~> 1.4'
gem 'puma', '~> 5.6'
gem 'rack-cors', '~> 1.1'
gem 'rake', '~> 13.0'
gem 'require_all', '~> 3.0'
gem 'sidekiq', '~> 6.5'
gem 'sinatra', '~> 2.2'
gem 'sinatra-activerecord', '~> 2.0'
gem 'sinatra-contrib', '~> 2.2'

group :development do
  gem 'rubocop', '~> 1.33'
  gem 'rubocop-performance', '~> 1.14'
  gem 'rubocop-rake', '~> 0.6'
  gem 'rubocop-rspec', '~> 2.12'
end

group :test do
  gem 'database_cleaner', '~> 2.0'
  gem 'rack-test', '~> 2.0'
  gem 'rspec', '~> 3.11'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.21', require: false
  gem 'vcr', '~> 6.1'
  gem 'webmock', '~> 3.17'
end

group :development, :test do
  gem 'bundler-audit', '~> 0.9'
  gem 'byebug', '~> 11.1'
  gem 'dotenv', '~> 2.8'
  gem 'factory_bot', '~> 6.2'
  gem 'faker', '~> 2.22'
  gem 'strong_migrations', '~> 1.2'
end

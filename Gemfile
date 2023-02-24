# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activesupport', '~> 7.0'
gem 'http', '~> 5.1'
gem 'oj', '~> 3.14'
gem 'pagy', '~> 6.0'
gem 'pg', '~> 1.4'
gem 'puma', '~> 6.1'
gem 'rack-cors', '~> 1.1'
gem 'rake', '~> 13.0'
gem 'require_all', '~> 3.0'
gem 'sidekiq', '~> 7.0'
gem 'sinatra', '~> 3.0'
gem 'sinatra-activerecord', '~> 2.0'
gem 'sinatra-contrib', '~> 3.0'

group :development do
  gem 'rubocop', '~> 1.46'
  gem 'rubocop-performance', '~> 1.16'
  gem 'rubocop-rake', '~> 0.6'
  gem 'rubocop-rspec', '~> 2.18'
end

group :test do
  gem 'database_cleaner', '~> 2.0'
  gem 'rack-test', '~> 2.0'
  gem 'rspec', '~> 3.12'
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

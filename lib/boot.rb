ENV['RACK_ENV'] ||= 'development'
# Load the dependencies
require 'sidekiq'
require 'sidekiq/api'
require 'require_all'

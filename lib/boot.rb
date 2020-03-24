ENV['RACK_ENV'] ||= 'development'
# Load the dependencies
require 'active_support/all'
require 'sidekiq'
require 'sidekiq/api'
require 'require_all'

require_rel 'initializers/*.rb'

require_rel '**/*.rb'

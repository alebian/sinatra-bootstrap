ENV['RACK_ENV'] ||= 'development'
# Load the dependencies
require 'active_support/all'
require 'sidekiq'
require 'sidekiq/api'
require 'require_all'

if %w[development].include?(ENV['RACK_ENV'])
  require 'byebug'
  require 'dotenv/load'
end

require_relative 'exceptions'
require_relative 'application'

require_rel 'initializers/*.rb'

require_rel '**/*.rb'

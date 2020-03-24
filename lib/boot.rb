ENV['RACK_ENV'] ||= 'development'
# Load the dependencies
require 'active_support/all'
require 'http'
require 'json'
require 'sidekiq'
require 'sidekiq/api'
require 'sinatra/activerecord'
require 'require_all'

if %w[development].include?(ENV['RACK_ENV'])
  require 'byebug'
  require 'dotenv/load'
  ActiveRecord::Base.logger&.level = :info
end

require_relative 'exceptions'
require_relative 'application'

require_rel 'initializers/*.rb'

require_rel '**/*.rb'

Encoding.default_external = 'utf-8'
Encoding.default_internal = 'utf-8'

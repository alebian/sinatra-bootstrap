# This file is used by Rack-based servers to start the application.

require_relative 'web/app'
require 'sidekiq/web'

map '/' do
  run Web::App
end

map '/sidekiq' do
  run Sidekiq::Web
end

# This file is used by Rack-based servers to start the application.

require_relative 'web/app'
require 'sidekiq/web'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins { |source, env| source }
    resource '/*',
      headers: %w[Authorization Content-Type],
      methods: %i[options get post put patch delete],
      credentials: true
  end
end

map '/' do
  run Web::App
end

map '/sidekiq' do
  run Sidekiq::Web
end

require_relative '../lib/boot'
require_relative 'base'

require_rel 'controllers'
require_rel 'middlewares'

module Web
  class App < Base
    helpers Sinatra::CustomLogger

    use Middlewares::FilteredLogging

    use Controllers::Health

    configure do
      disable :logging

      logger = Application.logger
      set :logger, logger
    end
  end
end

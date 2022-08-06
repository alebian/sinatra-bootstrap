module Web
  module Middlewares
    class FilteredLogging < Rack::CommonLogger
      LOGGING_BLACKLIST = ['/health'].freeze

      def call(env)
        return @app.call(env) if LOGGING_BLACKLIST.include?(env['PATH_INFO'])

        start_time = Time.current
        response = @app.call(env)
        log_request(env, response, start_time)
        response
      end

      private

      def log_request(env, response, start_time)
        status, = response
        Application.logger.info(
          type: 'Request',
          path: env['REQUEST_PATH'],
          method: env['REQUEST_METHOD'],
          status:,
          duration: 1000 * (Time.current - start_time)
        )
      end
    end
  end
end

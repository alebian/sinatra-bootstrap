workers Integer(ENV.fetch('PUMA_WORKERS', 0))

threads Integer(ENV.fetch('PUMA_THREADS', 8)), Integer(ENV.fetch('PUMA_THREADS', 8))

preload_app!

port ENV.fetch('WEBSERVER_PORT', 4567)

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

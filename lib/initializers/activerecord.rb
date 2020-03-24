ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.connection_pool.disconnect!
  config = ActiveRecord::Base.configurations[ENV['RACK_ENV']]
  config['pool'] = ENV['DATABASE_CONNECTION_POOL'] || 5
  ActiveRecord::Base.establish_connection(config)
end

Sidekiq.configure_server do |config|
  config.redis = { url: Application.secrets.redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Application.secrets.redis_url }
end

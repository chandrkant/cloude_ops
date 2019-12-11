# Sidekiq.configure_server do |config|
#     config.redis = { url: 'redis://localhost:6379/0' }

#     # Add SentryErrorLogger to lib/sidekiq/middleware/server/
#   # Register SentryErrorLogger in `config/initializers/sidekiq.rb`
#     config.server_middleware do |chain|
#       chain.add Sidekiq::Middleware::Server::SentryErrorLogger
#     end
# end

# Sidekiq.configure_client do |config|
#     config.redis = { url: 'redis://localhost:6379/0' }
# end

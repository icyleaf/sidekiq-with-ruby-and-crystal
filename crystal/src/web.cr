require "sidekiq/web"

Kemal.config do |config|
  # To enable SSL termination:
  # ./web --ssl --ssl-key-file your_key_file --ssl-cert-file your_cert_file
  #
  # For more options, including changing the listening port:
  # ./web --help
  #
  # Basic authentication:
  #
  # config.add_handler Kemal::Middleware::HTTPBasicAuth.new("username", "password")
  config.port = 3120
end

ENV["LOCAL_REDIS"] = "redis://localhost:6379/8"
ENV["REDIS_PROVIDER"] = "LOCAL_REDIS"

# Exact same configuration for the Client API as above
Sidekiq::Client.default_context = Sidekiq::Client::Context.new

Kemal.run
require "sidekiq"
require "sidekiq/cli"
require "./workers/*"

ENV["LOCAL_REDIS"] = "redis://localhost:6379/8"
ENV["REDIS_PROVIDER"] = "LOCAL_REDIS"

# set default queue
args = %w(-q crystal)

cli = Sidekiq::CLI.new(args)
server = cli.configure do |config|
  # middleware would be added here
end

cli.run(server)
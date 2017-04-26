require "sidekiq"

ENV["LOCAL_REDIS"] = "redis://localhost:6379/8"
ENV["REDIS_PROVIDER"] = "LOCAL_REDIS"

workers = %w(Ping1Worker Ping2Worker)
workers.each do |wk_class|
  job = Sidekiq::Job.new
  job.queue = "default"
  job.klass = wk_class

  Sidekiq::Client.default_context = Sidekiq::Client::Context.new

  client = Sidekiq::Client.new
  job_id = client.push(job)
  puts "[#{wk_class}] job id: #{job_id}"
end
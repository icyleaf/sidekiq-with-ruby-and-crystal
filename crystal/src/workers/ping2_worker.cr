class Ping2Worker
  include Sidekiq::Worker
  sidekiq_options do |job|
    job.queue = "crystal"
  end

  def perform()
    logger.info "[Crystal] PONG PONG !!"
  end
end
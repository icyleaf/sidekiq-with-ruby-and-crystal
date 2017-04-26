class Ping1Worker
  include Sidekiq::Worker
  sidekiq_options do |job|
    job.queue = "crystal"
  end

  def perform()
    logger.info "[Crystal] PONG !"
  end
end
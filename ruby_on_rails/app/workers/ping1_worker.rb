class Ping1Worker
  include Sidekiq::Worker

  def perform(*args)
    logger.info "[Ruby] PONG !"
  end
end

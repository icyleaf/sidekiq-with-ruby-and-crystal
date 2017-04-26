class Ping2Worker
  include Sidekiq::Worker

  def perform(*args)
    logger.info "[Ruby] PONG PONG !!"
  end
end

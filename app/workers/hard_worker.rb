class HardWorker
  include Sidekiq::Worker

  def perform()
    # Do something
    puts '===============>'
  end
end

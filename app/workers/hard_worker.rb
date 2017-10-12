class HardWorker
  include Sidekiq::Worker

  def perform()
    # Do something
    Article.all.update_all(view_count: 0)
  end
end

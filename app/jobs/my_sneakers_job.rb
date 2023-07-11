class MySneakersJob < ApplicationJob
  self.queue_adapter = :sneakers

  def perform(*args)
    puts "Doing something with #{args.inspect} in MySneakersJob"
  end
end

class MyAsyncJob < ApplicationJob
  self.queue_adapter = :async

  def perform(*args)
    puts "Doing something with #{args.inspect} in MyAsyncJob"
  end
end

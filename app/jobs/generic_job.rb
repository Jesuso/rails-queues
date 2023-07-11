class GenericJob < ApplicationJob
  queue_as :foo

  def perform(*args)
    puts "Doing something with #{args.inspect}"
  end
end

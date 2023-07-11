class GenericJob < ApplicationJob
  def perform(*args)
    puts "Doing something with #{args.inspect} in GenericJob"
  end
end

class MyGenericJob < ApplicationJob
  def perform(*args)
    puts "Doing something with #{args.inspect} in MyGenericJob"
  end
end

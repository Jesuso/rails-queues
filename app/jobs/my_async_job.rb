class MyAsyncJob < ApplicationJob
  self.queue_adapter = :async

  def perform(args)
    puts "Doing something with #{args.inspect} in MyAsyncJob"
    sleep args['sleep'] if args['sleep'].present?
    puts "Fibonacci(#{args['fib']}) = #{fibonacci(args['fib'])}" if args['fib'].present?
  end

  private

  def fibonacci(n)
    n <= 1 ? n : fibonacci(n - 1) + fibonacci(n - 2)
  end
end

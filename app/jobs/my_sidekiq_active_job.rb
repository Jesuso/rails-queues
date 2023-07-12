class MySidekiqActiveJob < ApplicationJob
  self.queue_adapter = :sidekiq

  def perform(args)
    puts "Doing something with #{args.inspect} in MySidekiqActiveJob"
    sleep args['sleep'] if args['sleep'].present?
    puts "Fibonacci(#{args['fib']}) = #{fibonacci(args['fib'])}" if args['fib'].present?
  end

  private

  def fibonacci(n)
    n <= 1 ? n : fibonacci(n - 1) + fibonacci(n - 2)
  end
end

class MySidekiqJob
  include Sidekiq::Job

  def perform(*args)
    puts "Doing something with #{args.inspect} in MySidekiqJob"
  end
end

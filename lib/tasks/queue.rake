SLEEP = ENV['SLEEP'] ? ENV['SLEEP'].to_f : nil
SLEEP_RAND = ENV.fetch('SLEEP_RAND', 0).to_f
FIB = ENV['FIB'] ? ENV['FIB'].to_i : nil
FIB_RAND = ENV.fetch('FIB_RAND', 5).to_i

namespace :queue do
  desc 'Queue up load test jobs'

  task fib: :environment do
    puts "Current queue_adapter: #{Rails.application.config.active_job.queue_adapter}"
    puts "Current queue_adapter_immediate: #{Rails.application.config.active_job.queue_adapter_immediate}"
    job_count = ENV.fetch('JOB_COUNT', 100)&.to_i

    job_count.times do |i|
      
      puts "Enqueuing job #{i} with args: #{args.inspect}..."
      
      # MyAsyncJob.perform_later(args)
      # MySidekiqJob.perform_async(args)
      MySidekiqActiveJob.perform_later(args)
      MySneakersJob.perform_later(args)
    end

    puts "Enqueued #{job_count} jobs for each worker"
  end
end

def args
  args = {}
  args['sleep'] = SLEEP if SLEEP
  args['sleep'] = rand(SLEEP..(SLEEP + SLEEP_RAND)) if SLEEP
  args['fib'] = rand(FIB..(FIB + FIB_RAND)) if FIB

  args
end

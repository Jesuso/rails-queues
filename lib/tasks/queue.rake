def queue_multi(args)
  # MyGenericJob.perform_later(args)
  # MyAsyncJob.perform_later(args)
  # MySidekiqJob.perform_async(args)
  # MySidekiqActiveJob.perform_later(args)
  MySneakersJob.perform_later(args)
  # MyKarafkaJob.perform_later(args)
end

namespace :queue do
  desc 'Queue up load test jobs'

  task fib: :environment do
    job_count = ENV.fetch('JOB_COUNT', 100)&.to_i
    fib = ENV.fetch('FIB', 30).to_i
    fib_randomicity = ENV.fetch('FIB_RAND', 5).to_i

    job_count.times do |i|
      args = {'uuid' => SecureRandom.uuid, 'fib' => rand(fib..(fib + fib_randomicity))}
      puts "Enqueuing job #{i} with args: #{args.inspect}..."
      queue_multi(args)
    end

    puts "Enqueued #{job_count} jobs for each worker"
  end

  task sleep: :environment do
    job_count = ENV.fetch('JOB_COUNT', 100)&.to_i
    sleep_ = ENV.fetch('SLEEP', 2).to_f
    sleep_rand = ENV.fetch('SLEEP_RAND', 1).to_f

    job_count.times do |i|
      args = {'uuid' => SecureRandom.uuid, 'sleep' => rand(sleep_..(sleep_ + sleep_rand))}
      puts "Enqueuing job #{i} with args: #{args.inspect}..."
      queue_multi(args)
    end

    puts "Enqueued #{job_count} jobs for each worker"
  end
end

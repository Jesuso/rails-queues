# Queues

This is a sample project to compare different queue engines and how they behave under different scenarios.

## Setup

Running everything in a single terminal window:

```bash
docker-compose up
```

If you intend to run rails and the consumers in your host machine you could use docker only for the different queue engines like this:

```bash
# Run backends
docker-compose up redis rabbitmq kafka

# Run rails
rails s

# Run consumers
bundle exec sidekiq -C config/sidekiq.yml
bundle exec rake sneakers:run
bundle exec karafka server
```

## Changing concurrency (worker count)

You can control the concurrency independently for each of the systems with the following env vars `SNEAKERS_CONCURRENCY`, `SIDEKIQ_CONCURRENCY`, `KARAFKA_CONCURRENCY` for each of the processes. e.g.:

```bash
SNEAKERS_CONCURRENCY=10 bundle exec sidekiq -C config/sidekiq.yml
SNEAKERS_CONCURRENCY=10 bundle exec rake sneakers:run
KARAFKA_CONCURRENCY=10  bundle exec karafka server
```

## Pushing messages

You can push messages using the `ActiveJob` classes directly from the rails console:

```ruby
MyAsyncJob.perform_later({'fib' => 30})
MyGenericJob.perform_later({'fib' => 30})
MyKarafkaJob.perform_later({'fib' => 30})
MySneakersJob.perform_later({'fib' => 30})
MySidekiqActiveJob.perform_later({'fib' => 30})
MySidekiqJob.perform_async({'fib' => 30})
```

Or you can use the `rake` tasks to push messages to multiple queues at once:

```bash
rails queue:fib JOB_COUNT=100 FIB=30
```

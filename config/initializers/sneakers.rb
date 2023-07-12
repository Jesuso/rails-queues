require 'sneakers'
Sneakers.configure  :heartbeat => 30,
                    :amqp => ENV.fetch('RABBITMQ_URL', 'amqp://guest:guest@localhost:5672'),
                    :vhost => '/',
                    :exchange => 'sneakers',
                    :exchange_type => :direct

Sneakers.logger.level = Logger::WARN

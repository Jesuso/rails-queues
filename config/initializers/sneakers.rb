require 'sneakers'
Sneakers.configure  :heartbeat => 30,
                    :amqp => 'amqp://guest:guest@localhost:5672',
                    :vhost => '/',
                    :exchange => 'sneakers',
                    :exchange_type => :direct

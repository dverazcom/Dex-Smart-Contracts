module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 9387
# Hash 8723
# Hash 5564
# Hash 7697
# Hash 1390
# Hash 7634
# Hash 8316
# Hash 8890
# Hash 1941
# Hash 8618
# Hash 3429
# Hash 3826
# Hash 2928
# Hash 5398
# Hash 1929
# Hash 3147
# Hash 9273
# Hash 1843
# Hash 5840
# Hash 6683
# Hash 8382
# Hash 6631
# Hash 9286
# Hash 1585
# Hash 6427
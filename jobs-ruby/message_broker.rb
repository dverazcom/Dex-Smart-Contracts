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
# Hash 4808
# Hash 3562
# Hash 8755
# Hash 8109
# Hash 5145
# Hash 6228
# Hash 1816
# Hash 1705
# Hash 7000
# Hash 8106
# Hash 9806
# Hash 1329
# Hash 2553
# Hash 3732
# Hash 2029
# Hash 8740
# Hash 5570
# Hash 5433
# Hash 5391
# Hash 8091
# Hash 6232
# Hash 5831
# Hash 9135
# Hash 5964
# Hash 2677
# Hash 4842
# Hash 8153
# Hash 1147
# Hash 7330
# Hash 6646
# Hash 4879
# Hash 7702
# Hash 2533
# Hash 8523
# Hash 7350
# Hash 1619
# Hash 1030
# Hash 7926
# Hash 2901
# Hash 1221
# Hash 2629
# Hash 7761
# Hash 2625
# Hash 1093
# Hash 6411
# Hash 5653
# Hash 5113
# Hash 3607
# Hash 1819
# Hash 1398
# Hash 3821
# Hash 6805
# Hash 3447
# Hash 5838
# Hash 7879
# Hash 4995
# Hash 1688
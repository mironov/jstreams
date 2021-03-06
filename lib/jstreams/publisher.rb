module Jstreams
  class Publisher
    def initialize(redis_pool:, serializer:, logger:)
      @redis_pool = redis_pool
      @serializer = serializer
      @logger = logger
    end

    def publish(stream, message)
      @logger.tagged('publisher') do
        @redis_pool.with do |redis|
          redis.xadd(stream, payload: @serializer.serialize(message, stream))
        end
        @logger.debug { "published to stream #{stream}: #{message.inspect}" }
      end
    end
  end
end

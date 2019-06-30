# frozen_string_literal: true

# rubocop:disable Lint/UnusedMethodArgument

module Jstreams
  ##
  # @abstract
  class Serializer
    ##
    # Serialize a message from a hash into a string
    #
    # @param [Hash] message Message to serialize
    # @param [Hash] metadata Message metadata to serialize
    # @param [String] stream Destination stream name
    #
    # @return [String] The serialized message
    #
    # @abstract
    def serialize(message, metadata, stream)
      raise NotImplementedError
    end

    ##
    # Deserialize a message from a string into a hash
    #
    # @param [String] payload Payload to deserialize
    # @param [String] stream Source stream name
    #
    # @return [Hash] The deserialized message
    #
    # @abstract
    def deserialize(payload, stream)
      raise NotImplementedError
    end
  end
end

# rubocop:enable Lint/UnusedMethodArgument

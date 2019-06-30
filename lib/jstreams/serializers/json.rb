# frozen_string_literal: true

require 'json'
require_relative '../serializer'

module Jstreams
  module Serializers
    ##
    # Simple JSON serializer
    class JSON < Serializer
      ##
      # Serializes the given message to a JSON string
      #
      # @param [Hash] message Message to serialize
      # @param [Hash] _metadata Message metadata to serialize (unused)
      # @param [String] _stream Destination stream name (unused)
      #
      # @return [String] payload The JSON serialized message
      def serialize(message, _metadata, _stream)
        ::JSON.generate(message)
      end

      ##
      # Deserializes the given JSON message to a Hash
      #
      # @param [String] payload Payload to deserialize
      # @param [String] _stream Source stream name (unused)
      #
      # @return [Hash] The deserialized message
      def deserialize(payload, _stream)
        ::JSON.parse(payload)
      end
    end
  end
end

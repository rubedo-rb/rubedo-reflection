module Rubedo
  module Reflection

    ##
    # Class: database relation (table) specification
    #
    class Relation

      ##
      # Relation name
      #
      # Returns: {String}
      #
      attr_reader :name

      ##
      # Relation schema
      #
      # Returns: {String}
      #
      attr_reader :schema

      ##
      # Relation owner
      #
      attr_reader :owner

      ##
      # List of table columns
      #
      # Returns: {Array(Schema::Column)}
      #
      def columns
        fail(NotImplementedError)
      end

      ##
      # List of table indexes
      #
      # Returns: {Array(Schema::Index)}
      #
      def indexes
        fail(NotImplementedError)
      end

    private

      def initialize(name, props={})
        @name = name.to_s.freeze
      end

    end

  end
end

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
      # Returns: {Hash(Schema::Column)}
      #
      attr_reader :columns

      ##
      # List of table columns names
      #
      # Returns: {Array}
      #
      attr_reader :column_names

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

        @schema  = props[:schema] ? props[:schema].to_s.freeze : nil
        @owner   = props[:owner]
        @columns = (props[:columns] || {}).freeze
        @column_names = @columns.keys.freeze
      end

    end

  end
end

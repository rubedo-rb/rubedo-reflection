module Rubedo
  module Reflection

    ##
    # Class: database column specification
    #
    class Column

      ##
      # Column name
      #
      # Returns: {Symbol}
      #
      attr_reader :name

      ##
      # Column type
      #
      # Returns: {Rubedo::Type}
      #
      attr_reader :type

      ##
      # (NOT) NULL
      #
      # Returns: {Boolean} true if column allow null
      #
      def allow_null?
        @allow_null
      end

      ##
      # Default value
      #
      attr_reader :default

    private

      ##
      # Constructor:
      #
      # Params:
      # - name  {Symbol|String} column name
      # - props {Hash} column properties
      #   - type       {Rubedo::Type} column type
      #   - allow_null {Boolean}      does this column allow null?
      #   - default                   default value for column
      #
      def initialize(name, props={})
        @name = name.to_sym

        @type       = props[:type]
        @allow_null = props[:allow_null]
        @default    = props[:default]
      end

    end

  end
end

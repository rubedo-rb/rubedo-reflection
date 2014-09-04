module Rubedo
  module Reflection

    class Type
      include Singleton

      class << self

      private
        def name(type_name)

        end

        def primitive(klass)

        end

        def db_string(string)

        end
      end

      attr_reader :name

      attr_reader :primitive

      attr_reader :db_string

      def valid?(value)

      end

      def cast(value)

      end

    protected

      def test(value)
        true
      end

    private

      def initialize

      end

    end

  end
end

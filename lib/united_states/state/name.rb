# frozen_string_literal: true

module UnitedStates
  module State
    # A state name, requires the name be given on initialization.
    class Name
      def initialize(string)
        @string = string
      end

      def capitalize
        @string.capitalize
      end

      def to_s
        @string.capitalize
      end
    end
  end
end

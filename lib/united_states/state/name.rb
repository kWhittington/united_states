# frozen_string_literal: true

module UnitedStates
  module State
    # A state name, requires the name be given on initialization.
    class Name
      # @param string [String]
      #  the name of the State
      # @return [UnitedStates::State::Name]
      def initialize(string)
        @string = string
      end

      # @return [String]
      #  the State's name with a leading capital letter.
      def capitalize
        @string.capitalize
      end

      # @return [String]
      #  the State's name with a leading capital letter.
      def to_s
        @string.capitalize
      end
    end
  end
end

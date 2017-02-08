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

      # @param [UnitedStates::State::Name]
      # @return [Boolean]
      #  whether or not other.to_s matches self.to_s
      def ==(other)
        other.to_s == to_s
      end

      # @return [String]
      #  the State's name with a leading capital letter.
      def capitalize
        @string.capitalize
      end

      # @return [String]
      #  the State's name in all lowercase letters.
      def lowercase
        @string.downcase
      end

      # @return [String]
      #  the State's name with a leading capital letter.
      def to_s
        @string.capitalize
      end
    end
  end
end

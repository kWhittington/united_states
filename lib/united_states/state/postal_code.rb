# frozen_string_literal: true

module UnitedStates
  module State
    # A U.S. State postal code.
    class PostalCode
      # Thrown when someone attempts to make a PostalCode instance
      # from a string longer than 2 characters.
      class StringTooLongError < StandardError
        DEFAULT_MESSAGE = 'string too long, postal code must be 2 characters'

        def initialize(message = DEFAULT_MESSAGE)
          super(message)
        end
      end

      # Thrown when someone attempts to make a PostalCode instance
      # from a string shorter than 2 characters.
      class StringTooShortError < StandardError
        DEFAULT_MESSAGE = 'string too short, postal codes must be 2 characters'

        def initialize(message = DEFAULT_MESSAGE)
          super(message)
        end
      end

      # @param string [String]
      #  the postal code of the State
      # @raise [UnitedStates::State::PostalCode::StringTooLongError]
      #  if the string is over 2 characters in length
      # @raise [UnitedStates::State::PostalCode::StringTooShortError]
      #  if the string is under 2 characters in length
      # @return [UnitedStates::State::PostalCode]
      def initialize(string)
        ensure_string_not_too_long(string)
        ensure_string_not_too_short(string)
        @string = string
      end

      # @param [UnitedStates::State::PostalCode]
      # @return [Boolean]
      #  whether or not other.to_s matches self.to_s
      def ==(other)
        other.to_s == to_s
      end

      # @return [String]
      #  an all lowercase version of this Abbrevation
      def lowercase
        @string.downcase
      end

      # @return [String]
      #  an all uppercase version of this Abbrevation
      def uppercase
        @string.upcase
      end

      # @return [String]
      #  an all uppercase version of this PostalCode
      def to_s
        uppercase
      end

      private

      # @param string [String]
      # @raise [UnitedStates::State::PostalCode::StringTooLongError]
      #  if the string is over 2 characters in length
      # @return [true]
      #  if the string is under 2 characters in length
      def ensure_string_not_too_long(string)
        return true if string.length <= 2
        raise StringTooLongError,
              "#{string} too long, postal codes must be 2 characters"
      end

      # @param string [String]
      # @raise [UnitedStates::State::PostalCode::StringTooShortError]
      #  if the string is under 2 characters in length
      # @return [true]
      #  if the string is 2 characters or more in length
      def ensure_string_not_too_short(string)
        return true if string.length >= 2
        raise StringTooShortError,
              "#{string} too short, postal codes must be 2 characters"
      end
    end
  end
end

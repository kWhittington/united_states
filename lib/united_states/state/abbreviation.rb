# frozen_string_literal: true

module UnitedStates
  module State
    # A U.S. State abbreviation.
    class Abbreviation
      # Thrown when someone attempts to make an Abbreviation instance
      # from a string longer than 2 characters.
      class StringTooLongError < StandardError
        DEFAULT_MESSAGE = 'string too long, abbreviations must be 2 characters'

        def initialize(message = DEFAULT_MESSAGE)
          super(message)
        end
      end

      # Thrown when someone attempts to make an Abbreviation instance
      # from a string shorter than 2 characters.
      class StringTooShortError < StandardError
        DEFAULT_MESSAGE = 'string too short, abbreviations must be 2 characters'

        def initialize(message = DEFAULT_MESSAGE)
          super(message)
        end
      end

      # @param string [String]
      #  the abbreviation of the State
      # @return [UnitedStates::State::Abbreviation]
      def initialize(string)
        ensure_string_not_too_long(string)
        ensure_string_not_too_short(string)
        @string = string
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
      #  an all uppercase version of this Abbreviation
      def to_s
        uppercase
      end

      private

      # @param string [String]
      # @raise [UnitedStates::State::Abbreviation::StringTooLongError]
      #  if the string is over 2 characters in length
      # @return [true]
      #  if the string is under 2 characters in length
      def ensure_string_not_too_long(string)
        return true if string.length <= 2
        raise StringTooLongError,
              "#{string} too long, abbreviations must be 2 characters"
      end

      # @param string [String]
      # @raise [UnitedStates::State::Abbreviation::StringTooShortError]
      #  if the string is under 2 characters in length
      # @return [true]
      #  if the string is 2 characters or more in length
      def ensure_string_not_too_short(string)
        return true if string.length >= 2
        raise StringTooShortError,
              "#{string} too short, abbreviations must be 2 characters"
      end
    end
  end
end

# frozen_string_literal: true

module UnitedStates
  module State
    # A state's official U.S. Government Printing Office abbreviation.
    # https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations
    class GovernmentPrintingOfficeAbbreviation
      # An abbreviation more than two letters. (e.g. 'Mont.')
      class Abbreviation
        # @param str [String]
        # @raise RuntimeError
        #  if str is a two letter abbreviation
        def initialize(str = '')
          ensure_not_two_letters(str)
          @string = str
        end

        # @return [String]
        #  the State's name with a leading capital letter.
        def capitalize
          @string.split.map(&:capitalize).join(' ')
        end

        # @return [String]
        #  the State's name in all lowercase letters.
        def lowercase
          @string.downcase
        end

        # @return [String]
        #  the State's name all lowercase and separated by underscores.
        def snake_case
          lowercase.delete('.').tr(' ', '_')
        end

        # @return [String]
        #  the State's name with a leading capital letter.
        def to_s
          capitalize
        end

        private

        # @param string [String]
        #  the string to validate
        # @raise RuntimeError
        #  if string is a two letter abbreviation
        def ensure_not_two_letters(string)
          return true unless string =~ TwoLetterAbbreviation::REGEXP
          raise "\"#{string}\" is a two-letter abbreviation, "\
                'cannot be an Abbreviation'
        end
      end

      # An abbreviation with two period-sperated letters. (e.g. 'D.C.')
      class TwoLetterAbbreviation
        REGEXP = /\w\.\w\./

        # @param str [String]
        # @raise RuntimeError
        #  if str is not two letters
        def initialize(str = '')
          ensure_two_letters(str)
          @string = str
        end

        # @return [String]
        #  the State's name with a leading capital letter.
        def capitalize
          "#{@string.split('.').map(&:capitalize).join('.')}."
        end

        # @return [String]
        #  the State's name in all lowercase letters.
        def lowercase
          @string.downcase
        end

        # @return [String]
        #  the State's name all lowercase and separated by underscores.
        def snake_case
          lowercase.split('.').join('_')
        end

        # @return [String]
        #  the State's name with a leading capital letter.
        def to_s
          capitalize
        end

        private

        # @param string [String]
        #  the string to validate
        # @raise RuntimeError
        #  if string is more than two letters
        def ensure_two_letters(string)
          return true if string =~ REGEXP
          raise "\"#{string}\" is not two letters, "\
                'cannot be a TwoLetterAbbreviation'
        end
      end

      # @param string [String]
      #  the abbreviation of the State
      # @return [UnitedStates::State::GovernmentPrintingOfficeAbbreviation]
      def initialize(string)
        @abbreviation =
          if string =~ TwoLetterAbbreviation::REGEXP
            TwoLetterAbbreviation.new(string)
          else
            Abbreviation.new(string)
          end
      end

      # @return [String]
      #  the State's name with a leading capital letter.
      def capitalize
        @abbreviation.capitalize
      end

      # @return [String]
      #  the State's name in all lowercase letters.
      def lowercase
        @abbreviation.lowercase
      end

      # @return [String]
      #  the State's name all lowercase and separated by underscores.
      def snake_case
        @abbreviation.snake_case
      end

      # @return [String]
      #  the State's name with a leading capital letter.
      def to_s
        capitalize
      end
    end
  end
end

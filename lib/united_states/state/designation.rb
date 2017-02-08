# frozen_string_literal: true
require 'united_states/state/abbreviation'
require 'united_states/state/name'

module UnitedStates
  module State
    # Represents the various way to designate a state (e.g. name, abbreviation).
    class Designation
      # @!attribute [r] abbreviation
      #   @return [UnitedStates::State::Abbreviation]
      #    the state's abbreviation
      attr_reader :abbreviation

      # @!attribute [r] name
      #   @return [UnitedStates::State::Name]
      #    the state's name
      attr_reader :name

      # @param name [String]
      # @param abbreviation [String]
      # @raise [UnitedStates::State::Abbreviation::StringTooLongError]
      #  if the string is over 2 characters in length
      # @raise [UnitedStates::State::Abbreviation::StringTooShortError]
      #  if the string is under 2 characters in length
      def initialize(name:, abbreviation:)
        @name = UnitedStates::State::Name.new(name)
        @abbreviation = UnitedStates::State::Abbreviation.new(abbreviation)
      end

      # @param other [UnitedStates::State::Designation]
      # @return [Boolean]
      #  whether or not other's name and abbreviation is equal
      #  to this Designation's name and abbreviation
      def ==(other)
        other.name == name &&
          other.abbreviation == abbreviation
      end
    end
  end
end

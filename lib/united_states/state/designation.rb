# frozen_string_literal: true
require 'united_states/state/postal_code'
require 'united_states/state/name'

module UnitedStates
  module State
    # Represents the various way to designate a state (e.g. name, postal code).
    class Designation
      # @!attribute [r] postal_code
      #   @return [UnitedStates::State::PostalCode]
      #    the state's postal code
      attr_reader :postal_code

      # @!attribute [r] name
      #   @return [UnitedStates::State::Name]
      #    the state's name
      attr_reader :name

      # @param name [String]
      # @param postal_code [String]
      # @raise [UnitedStates::State::PostalCode::StringTooLongError]
      #  if the string is over 2 characters in length
      # @raise [UnitedStates::State::PostalCode::StringTooShortError]
      #  if the string is under 2 characters in length
      def initialize(name:, postal_code:)
        @name = UnitedStates::State::Name.new(name)
        @postal_code = UnitedStates::State::PostalCode.new(postal_code)
      end

      # @param other [UnitedStates::State::Designation]
      # @return [Boolean]
      #  whether or not other's name and postal code is equal
      #  to this Designation's name and postal code
      def ==(other)
        other.name == name &&
          other.postal_code == postal_code
      end
    end
  end
end

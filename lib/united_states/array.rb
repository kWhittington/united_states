# frozen_string_literal: true

module UnitedStates
  # UnitedStates::State::Designation Array-generating module.
  module Array
    # @example
    #  require 'united_states/array'
    #
    #  UnitedStates::Array.from_hashes(
    #    { name: 'Florida', postal_code: 'FL' },
    #    { name: 'Iowa', postal_code: 'IA'})
    # @param hashes [Array<Hash>]
    #  a collection of attributes as hashes
    # @return [Array<UnitedStates::State::Designation>]
    #  a collection of state designations made from the given hash attributes
    def self.from_hashes(*hashes)
      hashes.map do |hash|
        UnitedStates::State::Designation.from_hash(hash)
      end
    end

    # @example
    #  require 'united_states/array'
    #
    #  UnitedStates::Array.from_yaml(
    #    { Washington: { postal_code: 'WA' } }.to_yaml)
    #  # => [<UnitedStates::State::Designation...>]
    # @param yaml [String]
    #  a String representation of YAML.
    # @return [Array<UnitedStates::State::Designation>]
    #  a collection of state designations made from the given hash attributes
    # @raise UnitedStates::State::PostalCode::StringTooLongError
    #  if a designation has a postal code that too long
    # @raise UnitedStates::State::PostalCode::StringTooShortError
    #  if a designation has no postal code defined or is too short
    def self.from_yaml(yaml)
      return [] unless YAML.safe_load(yaml)
      YAML.safe_load(yaml).map do |key, value|
        UnitedStates::State::Designation.new(
          name: key, postal_code: value && value.fetch('postal_code', ''))
      end
    end

    # @example
    #  require 'united_states/array'
    #
    #  UnitedStates::Array.from_yaml_file(path: './states.yml')
    #  # => [<UnitedStates::State::Designation...>]
    # @param path [String]
    #  the path to the YAML file
    # @return [Array<UnitedStates::State::Designation>]
    #  a collection of state designations made from the YAML file
    # @raise UnitedStates::State::PostalCode::StringTooLongError
    #  if a designation has a postal code that too long
    # @raise UnitedStates::State::PostalCode::StringTooShortError
    #  if a designation has no postal code defined or is too short
    def self.from_yaml_file(path:)
      pathname = Pathname.new(path)
      return from_yaml(pathname.read) if pathname.exist?
      raise "\"#{path}\" does not exist.\n"\
            'Please supply a path to a YAML file.'
    end
  end
end

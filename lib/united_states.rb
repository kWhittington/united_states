# frozen_string_literal: true

require 'pathname'
require 'yaml'
require 'united_states/version'
require 'united_states/state/designation'

# Top-level namespace for this gem.
module UnitedStates
  # Thrown when someone attempts to search for a state with
  # the wrong name or postal code.
  class NoDesignationFoundError < StandardError
    DEFAULT_MESSAGE = 'No State was found.'.freeze

    def initialize(message = DEFAULT_MESSAGE)
      super(message)
    end
  end

  # @example
  #  UnitedStates['louisiana'] # => UnitedSt...Designation
  #  UnitedStates[:Ms] # => UnitedSt...Designation
  #  UnitedStates[:marx] # => NoDesignationFoundError
  # @param name_or_postal_code [String]
  # @return [UnitedStates::State::Desgination]
  #  the State Desgination matching the provided name or postal code.
  # @raise [NoDesignationFoundError]
  #  if no state Designation exists with the given name or postal code
  def self.[](name_or_postal_code)
    name_or_postal_code = name_or_postal_code.to_s
    invalid_postal_code = name_or_postal_code.length != 2
    return find_by_name(name_or_postal_code) if invalid_postal_code
    find_by_postal_code(name_or_postal_code)
  end

  # @return [Array<UnitedStates::State::Designation>]
  #  a collection of all U.S. State Designations.
  def self.all
    array_from_yaml_file(path: config_path)
  end

  # @example
  #  UnitedStates.array_from_hashes(
  #    { name: 'Florida', postal_code: 'FL' },
  #    { name: 'Iowa', postal_code: 'IA'})
  # @param hashes [Array<Hash>]
  #  a collection of attributes as hashes
  # @return [Array<UnitedStates::State::Designation>]
  #  a collection of state designations made from the given hash attributes
  def self.array_from_hashes(*hashes)
    hashes.map do |hash|
      UnitedStates::State::Designation.from_hash(hash)
    end
  end

  # @example
  #  require 'united_states'
  #
  #  UnitedStates.array_from_yaml(
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
  def self.array_from_yaml(yaml)
    return [] unless YAML.safe_load(yaml)
    YAML.safe_load(yaml).map do |key, value|
      UnitedStates::State::Designation.new(
        name: key, postal_code: value && value.fetch('postal_code', ''))
    end
  end

  # @example
  #  require 'united_states'
  #
  #  UnitedStates.array_from_yaml_file(path: './states.yml')
  #  # => [<UnitedStates::State::Designation...>]
  # @param path [String]
  #  the path to the YAML file
  # @return [Array<UnitedStates::State::Designation>]
  #  a collection of state designations made from the YAML file
  # @raise UnitedStates::State::PostalCode::StringTooLongError
  #  if a designation has a postal code that too long
  # @raise UnitedStates::State::PostalCode::StringTooShortError
  #  if a designation has no postal code defined or is too short
  def self.array_from_yaml_file(path:)
    pathname = Pathname.new(path)
    return array_from_yaml(pathname.read) if pathname.exist?
    raise "\"#{path}\" does not exist.\n"\
          'Please supply a path to a YAML file.'
  end

  # @return [String]
  #  the path to the Designations yaml file
  def self.config_path
    Pathname.new(__FILE__).parent.join('united_states/designations.yml')
  end

  # @example
  #  UnitedStates.find_by_name('louisiana') # => UnitedSt...Designation
  #  UnitedStates.find_by_name('marx') # => NoDesignationFoundError
  # @param name [String]
  # @return [UnitedStates::State::Desgination]
  #  the State Desgination matching the provided name.
  # @raise [NoDesignationFoundError]
  #  if no state Designation exists with the given name
  def self.find_by_name(name)
    name = UnitedStates::State::Name.new(name)
    all.find { |designation| designation.name == name } || raise(
      NoDesignationFoundError, "No State named, \"#{name},\" was found.")
  end

  # @example
  #  UnitedStates.find_by_postal_code('la') # => UnitedSt...Designation
  #  UnitedStates.find_by_postal_code('xx') # => NoDesignationFoundError
  # @param postal_code [String]
  # @return [UnitedStates::State::Designation]
  #  the state Designation matching the provided postal code.
  # @raise [NoDesignationFoundError]
  #  if no state Designation exists with the given postal code
  def self.find_by_postal_code(postal_code)
    postal_code = UnitedStates::State::PostalCode.new(postal_code)
    all.find { |designation| designation.postal_code == postal_code } || raise(
      NoDesignationFoundError,
      "No State with postal code, \"#{postal_code},\" was found.")
  end

  # @return [Array<UnitedStates::State::Name>]
  #  a collection of all U.S. State Names.
  def self.names
    all.map(&:name)
  end

  # @return [Array<UnitedStates::State::PostalCode>]
  #  a collection of all U.S. State postal codes.
  def self.postal_codes
    all.map(&:postal_code)
  end
end
# rubocop: enable Metrics/ModuleLength

# frozen_string_literal: true
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

  # rubocop: disable Metrics/MethodLength
  # rubocop: disable Style/BracesAroundHashParameters

  # @return [Array<UnitedStates::State::Designation>]
  #  a collection of all U.S. State Designations.
  def self.all
    array_from_hashes(
      { name: 'Alabama', postal_code: 'AL' },
      { name: 'Alaska', postal_code: 'AK' },
      { name: 'Arizona', postal_code: 'AZ' },
      { name: 'Arkansas', postal_code: 'AR' },
      { name: 'California', postal_code: 'CA' },
      { name: 'Colorado', postal_code: 'CO' },
      { name: 'Connecticut', postal_code: 'CT' },
      { name: 'Delaware', postal_code: 'DE' },
      { name: 'Florida', postal_code: 'FL' },
      { name: 'Georgia', postal_code: 'GA' },
      { name: 'Hawaii', postal_code: 'HI' },
      { name: 'Idaho', postal_code: 'ID' },
      { name: 'Illinois', postal_code: 'IL' },
      { name: 'Indiana', postal_code: 'IN' },
      { name: 'Iowa', postal_code: 'IA' },
      { name: 'Kansas', postal_code: 'KS' },
      { name: 'Kentucky', postal_code: 'KY' },
      { name: 'Louisiana', postal_code: 'LA' },
      { name: 'Maine', postal_code: 'ME' },
      { name: 'Maryland', postal_code: 'MD' },
      { name: 'Massachusetts', postal_code: 'MA' },
      { name: 'Michigan', postal_code: 'MI' },
      { name: 'Minnesota', postal_code: 'MN' },
      { name: 'Mississippi', postal_code: 'MS' },
      { name: 'Missouri', postal_code: 'MO' },
      { name: 'Montana', postal_code: 'MT' },
      { name: 'Nebraska', postal_code: 'NE' },
      { name: 'Nevada', postal_code: 'NV' },
      { name: 'New Hampshire', postal_code: 'NH' },
      { name: 'New Jersey', postal_code: 'NJ' },
      { name: 'New Mexico', postal_code: 'NM' },
      { name: 'New York', postal_code: 'NY' },
      { name: 'North Carolina', postal_code: 'NC' },
      { name: 'North Dakota', postal_code: 'ND' },
      { name: 'Ohio', postal_code: 'OH' },
      { name: 'Oklahoma', postal_code: 'OK' },
      { name: 'Oregon', postal_code: 'OR' },
      { name: 'Pennsylvania', postal_code: 'PA' },
      { name: 'Rhode Island', postal_code: 'RI' },
      { name: 'South Carolina', postal_code: 'SC' },
      { name: 'South Dakota', postal_code: 'SD' },
      { name: 'Tennessee', postal_code: 'TN' },
      { name: 'Texas', postal_code: 'TX' },
      { name: 'Utah', postal_code: 'UT' },
      { name: 'Vermont', postal_code: 'VT' },
      { name: 'Virginia', postal_code: 'VA' },
      { name: 'Washington', postal_code: 'WA' },
      { name: 'West Virginia', postal_code: 'WV' },
      { name: 'Wisconsin', postal_code: 'WI' },
      { name: 'Wyoming', postal_code: 'WY' })
  end
  # rubocop: enable Metrics/MethodLength
  # rubocop: enable Style/BracesAroundHashParameters

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

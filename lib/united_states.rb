# frozen_string_literal: true
require 'united_states/version'
require 'united_states/state/designation'

# rubocop: disable Metrics/ModuleLength
#
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

  # rubocop: disable Metrics/AbcSize
  # rubocop: disable Metrics/MethodLength
  # @return [Array<UnitedStates::State::Designation>]
  #  a collection of all U.S. State Designations.
  def self.all
    [
      UnitedStates::State::Designation.new(
        name: 'Alabama', postal_code: 'AL'),
      UnitedStates::State::Designation.new(
        name: 'Alaska', postal_code: 'AK'),
      UnitedStates::State::Designation.new(
        name: 'Arizona', postal_code: 'AZ'),
      UnitedStates::State::Designation.new(
        name: 'Arkansas', postal_code: 'AR'),
      UnitedStates::State::Designation.new(
        name: 'California', postal_code: 'CA'),
      UnitedStates::State::Designation.new(
        name: 'Colorado', postal_code: 'CO'),
      UnitedStates::State::Designation.new(
        name: 'Connecticut', postal_code: 'CT'),
      UnitedStates::State::Designation.new(
        name: 'Delaware', postal_code: 'DE'),
      UnitedStates::State::Designation.new(
        name: 'Florida', postal_code: 'FL'),
      UnitedStates::State::Designation.new(
        name: 'Georgia', postal_code: 'GA'),
      UnitedStates::State::Designation.new(
        name: 'Hawaii', postal_code: 'HI'),
      UnitedStates::State::Designation.new(
        name: 'Idaho', postal_code: 'ID'),
      UnitedStates::State::Designation.new(
        name: 'Illinois', postal_code: 'IL'),
      UnitedStates::State::Designation.new(
        name: 'Indiana', postal_code: 'IN'),
      UnitedStates::State::Designation.new(
        name: 'Iowa', postal_code: 'IA'),
      UnitedStates::State::Designation.new(
        name: 'Kansas', postal_code: 'KS'),
      UnitedStates::State::Designation.new(
        name: 'Kentucky', postal_code: 'KY'),
      UnitedStates::State::Designation.new(
        name: 'Louisiana', postal_code: 'LA'),
      UnitedStates::State::Designation.new(
        name: 'Maine', postal_code: 'ME'),
      UnitedStates::State::Designation.new(
        name: 'Maryland', postal_code: 'MD'),
      UnitedStates::State::Designation.new(
        name: 'Massachusetts', postal_code: 'MA'),
      UnitedStates::State::Designation.new(
        name: 'Michigan', postal_code: 'MI'),
      UnitedStates::State::Designation.new(
        name: 'Minnesota', postal_code: 'MN'),
      UnitedStates::State::Designation.new(
        name: 'Mississippi', postal_code: 'MS'),
      UnitedStates::State::Designation.new(
        name: 'Missouri', postal_code: 'MO'),
      UnitedStates::State::Designation.new(
        name: 'Montana', postal_code: 'MT'),
      UnitedStates::State::Designation.new(
        name: 'Nebraska', postal_code: 'NE'),
      UnitedStates::State::Designation.new(
        name: 'Nevada', postal_code: 'NV'),
      UnitedStates::State::Designation.new(
        name: 'New Hampshire', postal_code: 'NH'),
      UnitedStates::State::Designation.new(
        name: 'New Jersey', postal_code: 'NJ'),
      UnitedStates::State::Designation.new(
        name: 'New Mexico', postal_code: 'NM'),
      UnitedStates::State::Designation.new(
        name: 'New York', postal_code: 'NY'),
      UnitedStates::State::Designation.new(
        name: 'North Carolina', postal_code: 'NC'),
      UnitedStates::State::Designation.new(
        name: 'North Dakota', postal_code: 'ND'),
      UnitedStates::State::Designation.new(
        name: 'Ohio', postal_code: 'OH'),
      UnitedStates::State::Designation.new(
        name: 'Oklahoma', postal_code: 'OK'),
      UnitedStates::State::Designation.new(
        name: 'Oregon', postal_code: 'OR'),
      UnitedStates::State::Designation.new(
        name: 'Pennsylvania', postal_code: 'PA'),
      UnitedStates::State::Designation.new(
        name: 'Rhode Island', postal_code: 'RI'),
      UnitedStates::State::Designation.new(
        name: 'South Carolina', postal_code: 'SC'),
      UnitedStates::State::Designation.new(
        name: 'South Dakota', postal_code: 'SD'),
      UnitedStates::State::Designation.new(
        name: 'Tennessee', postal_code: 'TN'),
      UnitedStates::State::Designation.new(
        name: 'Texas', postal_code: 'TX'),
      UnitedStates::State::Designation.new(
        name: 'Utah', postal_code: 'UT'),
      UnitedStates::State::Designation.new(
        name: 'Vermont', postal_code: 'VT'),
      UnitedStates::State::Designation.new(
        name: 'Virginia', postal_code: 'VA'),
      UnitedStates::State::Designation.new(
        name: 'Washington', postal_code: 'WA'),
      UnitedStates::State::Designation.new(
        name: 'West Virginia', postal_code: 'WV'),
      UnitedStates::State::Designation.new(
        name: 'Wisconsin', postal_code: 'WI'),
      UnitedStates::State::Designation.new(
        name: 'Wyoming', postal_code: 'WY')
    ]
  end
  # rubocop: enable Metrics/AbcSize
  # rubocop: enable Metrics/MethodLength

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

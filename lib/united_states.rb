# frozen_string_literal: true
require 'united_states/version'
require 'united_states/state/designation'

# rubocop: disable Metrics/ModuleLength
#
# Top-level namespace for this gem.
module UnitedStates
  # rubocop: disable Metrics/AbcSize
  # rubocop: disable Metrics/MethodLength
  # @return [Array<UnitedStates::State::Designation>]
  #  a collection of all U.S. State Designations.
  def self.all
    [
      UnitedStates::State::Designation.new(
        name: 'Alabama', abbreviation: 'AL'),
      UnitedStates::State::Designation.new(
        name: 'Alaska', abbreviation: 'AK'),
      UnitedStates::State::Designation.new(
        name: 'Arizona', abbreviation: 'AZ'),
      UnitedStates::State::Designation.new(
        name: 'Arkansas', abbreviation: 'AR'),
      UnitedStates::State::Designation.new(
        name: 'California', abbreviation: 'CA'),
      UnitedStates::State::Designation.new(
        name: 'Colorado', abbreviation: 'CO'),
      UnitedStates::State::Designation.new(
        name: 'Connecticut', abbreviation: 'CT'),
      UnitedStates::State::Designation.new(
        name: 'Delaware', abbreviation: 'DE'),
      UnitedStates::State::Designation.new(
        name: 'Florida', abbreviation: 'FL'),
      UnitedStates::State::Designation.new(
        name: 'Georgia', abbreviation: 'GA'),
      UnitedStates::State::Designation.new(
        name: 'Hawaii', abbreviation: 'HI'),
      UnitedStates::State::Designation.new(
        name: 'Idaho', abbreviation: 'ID'),
      UnitedStates::State::Designation.new(
        name: 'Illinois', abbreviation: 'IL'),
      UnitedStates::State::Designation.new(
        name: 'Indiana', abbreviation: 'IN'),
      UnitedStates::State::Designation.new(
        name: 'Iowa', abbreviation: 'IA'),
      UnitedStates::State::Designation.new(
        name: 'Kansas', abbreviation: 'KS'),
      UnitedStates::State::Designation.new(
        name: 'Kentucky', abbreviation: 'KY'),
      UnitedStates::State::Designation.new(
        name: 'Louisiana', abbreviation: 'LA'),
      UnitedStates::State::Designation.new(
        name: 'Maine', abbreviation: 'ME'),
      UnitedStates::State::Designation.new(
        name: 'Maryland', abbreviation: 'MD'),
      UnitedStates::State::Designation.new(
        name: 'Massachusetts', abbreviation: 'MA'),
      UnitedStates::State::Designation.new(
        name: 'Michigan', abbreviation: 'MI'),
      UnitedStates::State::Designation.new(
        name: 'Minnesota', abbreviation: 'MN'),
      UnitedStates::State::Designation.new(
        name: 'Mississippi', abbreviation: 'MS'),
      UnitedStates::State::Designation.new(
        name: 'Missouri', abbreviation: 'MO'),
      UnitedStates::State::Designation.new(
        name: 'Montana', abbreviation: 'MT'),
      UnitedStates::State::Designation.new(
        name: 'Nebraska', abbreviation: 'NE'),
      UnitedStates::State::Designation.new(
        name: 'Nevada', abbreviation: 'NV'),
      UnitedStates::State::Designation.new(
        name: 'New Hampshire', abbreviation: 'NH'),
      UnitedStates::State::Designation.new(
        name: 'New Jersey', abbreviation: 'NJ'),
      UnitedStates::State::Designation.new(
        name: 'New Mexico', abbreviation: 'NM'),
      UnitedStates::State::Designation.new(
        name: 'New York', abbreviation: 'NY'),
      UnitedStates::State::Designation.new(
        name: 'North Carolina', abbreviation: 'NC'),
      UnitedStates::State::Designation.new(
        name: 'North Dakota', abbreviation: 'ND'),
      UnitedStates::State::Designation.new(
        name: 'Ohio', abbreviation: 'OH'),
      UnitedStates::State::Designation.new(
        name: 'Oklahoma', abbreviation: 'OK'),
      UnitedStates::State::Designation.new(
        name: 'Oregon', abbreviation: 'OR'),
      UnitedStates::State::Designation.new(
        name: 'Pennsylvania', abbreviation: 'PA'),
      UnitedStates::State::Designation.new(
        name: 'Rhode Island', abbreviation: 'RI'),
      UnitedStates::State::Designation.new(
        name: 'South Carolina', abbreviation: 'SC'),
      UnitedStates::State::Designation.new(
        name: 'South Dakota', abbreviation: 'SD'),
      UnitedStates::State::Designation.new(
        name: 'Tennessee', abbreviation: 'TN'),
      UnitedStates::State::Designation.new(
        name: 'Texas', abbreviation: 'TX'),
      UnitedStates::State::Designation.new(
        name: 'Utah', abbreviation: 'UT'),
      UnitedStates::State::Designation.new(
        name: 'Vermont', abbreviation: 'VT'),
      UnitedStates::State::Designation.new(
        name: 'Virginia', abbreviation: 'VA'),
      UnitedStates::State::Designation.new(
        name: 'Washington', abbreviation: 'WA'),
      UnitedStates::State::Designation.new(
        name: 'West Virginia', abbreviation: 'WV'),
      UnitedStates::State::Designation.new(
        name: 'Wisconsin', abbreviation: 'WI'),
      UnitedStates::State::Designation.new(
        name: 'Wyoming', abbreviation: 'WY')
    ]
  end
  # rubocop: enable Metrics/AbcSize
  # rubocop: enable Metrics/MethodLength

  # @return [Array<UnitedStates::State::Name>]
  #  a collection of all U.S. State Names.
  def self.names
    all.map(&:name)
  end
end
# rubocop: enable Metrics/ModuleLength

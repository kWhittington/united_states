# frozen_string_literal: true
require 'spec_helper'
require 'united_states'

RSpec.describe UnitedStates do
  it 'has a version number' do
    expect(UnitedStates::VERSION).not_to be_nil
  end

  it 'loads UnitedStates::State::Name' do
    expect(UnitedStates::State::Name).not_to be_nil
  end

  describe '.all' do
    subject(:all) { described_class.all }

    it('contains 50 designations') { expect(all.count).to eq(50) }

    # rubocop: disable RSpec/ExampleLength
    it 'contains each state designations' do
      is_expected.to contain_exactly(
        UnitedStates::State::Designation.new(
          name: 'alabama', abbreviation: 'al'),
        UnitedStates::State::Designation.new(
          name: 'alaska', abbreviation: 'ak'),
        UnitedStates::State::Designation.new(
          name: 'arizona', abbreviation: 'az'),
        UnitedStates::State::Designation.new(
          name: 'arkansas', abbreviation: 'ar'),
        UnitedStates::State::Designation.new(
          name: 'california', abbreviation: 'ca'),
        UnitedStates::State::Designation.new(
          name: 'colorado', abbreviation: 'co'),
        UnitedStates::State::Designation.new(
          name: 'connecticut', abbreviation: 'ct'),
        UnitedStates::State::Designation.new(
          name: 'delaware', abbreviation: 'de'),
        UnitedStates::State::Designation.new(
          name: 'florida', abbreviation: 'fl'),
        UnitedStates::State::Designation.new(
          name: 'georgia', abbreviation: 'ga'),
        UnitedStates::State::Designation.new(
          name: 'hawaii', abbreviation: 'hi'),
        UnitedStates::State::Designation.new(
          name: 'idaho', abbreviation: 'id'),
        UnitedStates::State::Designation.new(
          name: 'illinois', abbreviation: 'il'),
        UnitedStates::State::Designation.new(
          name: 'indiana', abbreviation: 'in'),
        UnitedStates::State::Designation.new(
          name: 'iowa', abbreviation: 'ia'),
        UnitedStates::State::Designation.new(
          name: 'kansas', abbreviation: 'ks'),
        UnitedStates::State::Designation.new(
          name: 'kentucky', abbreviation: 'ky'),
        UnitedStates::State::Designation.new(
          name: 'louisiana', abbreviation: 'la'),
        UnitedStates::State::Designation.new(
          name: 'maine', abbreviation: 'me'),
        UnitedStates::State::Designation.new(
          name: 'maryland', abbreviation: 'md'),
        UnitedStates::State::Designation.new(
          name: 'massachusetts', abbreviation: 'ma'),
        UnitedStates::State::Designation.new(
          name: 'michigan', abbreviation: 'mi'),
        UnitedStates::State::Designation.new(
          name: 'minnesota', abbreviation: 'mn'),
        UnitedStates::State::Designation.new(
          name: 'mississippi', abbreviation: 'ms'),
        UnitedStates::State::Designation.new(
          name: 'missouri', abbreviation: 'mo'),
        UnitedStates::State::Designation.new(
          name: 'montana', abbreviation: 'mt'),
        UnitedStates::State::Designation.new(
          name: 'nebraska', abbreviation: 'ne'),
        UnitedStates::State::Designation.new(
          name: 'nevada', abbreviation: 'nv'),
        UnitedStates::State::Designation.new(
          name: 'new hampshire', abbreviation: 'nh'),
        UnitedStates::State::Designation.new(
          name: 'new jersey', abbreviation: 'nj'),
        UnitedStates::State::Designation.new(
          name: 'new mexico', abbreviation: 'nm'),
        UnitedStates::State::Designation.new(
          name: 'new york', abbreviation: 'ny'),
        UnitedStates::State::Designation.new(
          name: 'north carolina', abbreviation: 'nc'),
        UnitedStates::State::Designation.new(
          name: 'north dakota', abbreviation: 'nd'),
        UnitedStates::State::Designation.new(
          name: 'ohio', abbreviation: 'oh'),
        UnitedStates::State::Designation.new(
          name: 'oklahoma', abbreviation: 'ok'),
        UnitedStates::State::Designation.new(
          name: 'oregon', abbreviation: 'or'),
        UnitedStates::State::Designation.new(
          name: 'pennsylvania', abbreviation: 'pa'),
        UnitedStates::State::Designation.new(
          name: 'rhode island', abbreviation: 'ri'),
        UnitedStates::State::Designation.new(
          name: 'south carolina', abbreviation: 'sc'),
        UnitedStates::State::Designation.new(
          name: 'south dakota', abbreviation: 'sd'),
        UnitedStates::State::Designation.new(
          name: 'tennessee', abbreviation: 'tn'),
        UnitedStates::State::Designation.new(
          name: 'texas', abbreviation: 'tx'),
        UnitedStates::State::Designation.new(
          name: 'utah', abbreviation: 'ut'),
        UnitedStates::State::Designation.new(
          name: 'vermont', abbreviation: 'vt'),
        UnitedStates::State::Designation.new(
          name: 'virginia', abbreviation: 'va'),
        UnitedStates::State::Designation.new(
          name: 'washington', abbreviation: 'wa'),
        UnitedStates::State::Designation.new(
          name: 'west virginia', abbreviation: 'wv'),
        UnitedStates::State::Designation.new(
          name: 'wisconsin', abbreviation: 'wi'),
        UnitedStates::State::Designation.new(
          name: 'wyoming', abbreviation: 'wy'))
    end
    # rubocop: enable RSpec/ExampleLength

    describe '.names' do
      subject(:names) { described_class.names }

      it('contains 50 state names') { expect(names.count).to eq(50) }

      it "contains each state designation's name" do
        is_expected.to match_array(described_class.all.map(&:name))
      end
    end
  end
end

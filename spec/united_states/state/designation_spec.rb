# frozen_string_literal: true
require 'spec_helper'
require 'united_states/state/designation'

RSpec.describe UnitedStates::State::Designation do
  subject :designation do
    described_class.new(name: name, abbreviation: abbreviation)
  end

  describe '.new(name:, abbreviation:)' do
    subject :new do
      described_class.new(name: name, abbreviation: abbreviation)
    end

    let(:name) { Faker::Lorem.word }

    context 'when abbreviation.length > 2' do
      let(:abbreviation) { Faker::Lorem.characters(3) }

      it 'raises UnitedStates::State::Abbreviation::StringTooLongError' do
        expect { new }.to raise_error(
          UnitedStates::State::Abbreviation::StringTooLongError,
          "#{abbreviation} too long, abbreviations must be 2 characters")
      end
    end

    context 'when abbreviation.length < 2' do
      let(:abbreviation) { Faker::Lorem.character }

      it 'raises UnitedStates::State::Abbreviation::StringTooShortError' do
        expect { new }.to raise_error(
          UnitedStates::State::Abbreviation::StringTooShortError,
          "#{abbreviation} too short, abbreviations must be 2 characters")
      end
    end
  end
end

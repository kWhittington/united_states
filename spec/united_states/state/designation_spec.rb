# frozen_string_literal: true
require 'spec_helper'
require 'united_states/state/designation'

RSpec.describe UnitedStates::State::Designation do
  subject :designation do
    described_class.new(name: name, postal_code: postal_code)
  end

  describe '.new(name:, postal_code:)' do
    subject :new do
      described_class.new(name: name, postal_code: postal_code)
    end

    let(:name) { Faker::Lorem.word }

    context 'when postal_code.length > 2' do
      let(:postal_code) { Faker::Lorem.characters(3) }

      it 'raises UnitedStates::State::PostalCode::StringTooLongError' do
        expect { new }.to raise_error(
          UnitedStates::State::PostalCode::StringTooLongError,
          "#{postal_code} too long, postal codes must be 2 characters")
      end
    end

    context 'when postal_code.length < 2' do
      let(:postal_code) { Faker::Lorem.character }

      it 'raises UnitedStates::State::PostalCode::StringTooShortError' do
        expect { new }.to raise_error(
          UnitedStates::State::PostalCode::StringTooShortError,
          "#{postal_code} too short, postal codes must be 2 characters")
      end
    end
  end
end

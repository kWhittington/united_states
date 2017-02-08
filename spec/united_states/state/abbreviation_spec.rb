# frozen_string_literal: true
require 'spec_helper'
require 'united_states/state/abbreviation'

RSpec.describe UnitedStates::State::Abbreviation do
  subject(:abbreviation) { described_class.new(string) }
  let(:string) { Faker::Lorem.characters(2) }

  describe '.new(string)' do
    subject(:new) { described_class.new(string) }

    context 'when string.length > 2' do
      let(:string) { Faker::Lorem.characters(4) }

      it 'raises UnitedStates::State::Abbreviation::StringTooLongError' do
        expect { new }.to raise_error(
          UnitedStates::State::Abbreviation::StringTooLongError)
      end
    end

    context 'when string.length == 2' do
      let(:string) { Faker::Lorem.characters(2) }

      it 'is a new Abbreviation instance' do
        is_expected.to be_an(described_class)
      end
    end

    context 'when string.length < 2' do
      let(:string) { Faker::Lorem.characters(1) }

      it 'raises UnitedStates::State::Abbreviation::StringTooShortError' do
        expect { new }.to raise_error(
          UnitedStates::State::Abbreviation::StringTooShortError)
      end
    end
  end
end

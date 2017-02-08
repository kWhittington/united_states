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

  describe '#uppercase' do
    subject(:uppercase) { abbreviation.uppercase }

    context 'when the initial string is all lowercase' do
      let(:string) { 'la' }

      it 'is an uppercase version' do
        is_expected.to eq('LA')
      end
    end

    context 'when the initial string is all uppercase' do
      let(:string) { 'LA' }

      it 'is an uppercase version' do
        is_expected.to eq('LA')
      end
    end

    context 'when the inital string is mixed case' do
      let(:string) { 'lA' }

      it 'is an uppercase version' do
        is_expected.to eq('LA')
      end
    end
  end
end

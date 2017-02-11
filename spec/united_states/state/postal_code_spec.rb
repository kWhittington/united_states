# frozen_string_literal: true
require 'spec_helper'
require 'united_states/state/postal_code'

RSpec.describe UnitedStates::State::PostalCode do
  subject(:postal_code) { described_class.new(string) }
  let(:string) { Faker::Lorem.characters(2) }

  describe '.new(string)' do
    subject(:new) { described_class.new(string) }

    context 'when string.length > 2' do
      let(:string) { Faker::Lorem.characters(4) }

      it 'raises UnitedStates::State::PostalCode::StringTooLongError' do
        expect { new }.to raise_error(
          UnitedStates::State::PostalCode::StringTooLongError)
      end
    end

    context 'when string.length == 2' do
      let(:string) { Faker::Lorem.characters(2) }

      it 'is a new PostalCode instance' do
        is_expected.to be_an(described_class)
      end
    end

    context 'when string.length < 2' do
      let(:string) { Faker::Lorem.character }

      it 'raises UnitedStates::State::PostalCode::StringTooShortError' do
        expect { new }.to raise_error(
          UnitedStates::State::PostalCode::StringTooShortError)
      end
    end
  end

  describe '#==(other)' do
    subject(:equals?) { postal_code == other }

    context 'when other.to_s == self.to_s' do
      let(:other) { described_class.new(string) }

      it('is true') { is_expected.to be(true) }
    end

    context 'when other.to_s != self.to_s' do
      let(:string) { 'cd' }
      let(:other) { described_class.new('ab') }

      it('is false') { is_expected.to be(false) }
    end
  end

  describe '#lowercase' do
    subject(:lowercase) { postal_code.lowercase }

    context 'when the initial string is all lowercase' do
      let(:string) { 'la' }

      it 'is an lowercase version' do
        is_expected.to eq('la')
      end
    end

    context 'when the initial string is all uppercase' do
      let(:string) { 'LA' }

      it 'is an lowercase version' do
        is_expected.to eq('la')
      end
    end

    context 'when the inital string is mixed case' do
      let(:string) { 'lA' }

      it 'is an lowercase version' do
        is_expected.to eq('la')
      end
    end
  end

  describe '#to_s' do
    subject(:to_s) { postal_code.to_s }

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

  describe '#uppercase' do
    subject(:uppercase) { postal_code.uppercase }

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

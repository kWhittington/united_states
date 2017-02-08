# frozen_string_literal: true
require 'spec_helper'
require 'faker'
require 'united_states/state/name'

RSpec.describe UnitedStates::State::Name do
  subject(:name) { described_class.new(string) }
  let(:string) { Faker::Lorem.word }

  describe '#==(other)' do
    subject(:equals?) { name == other }

    context 'when other#to_s == name.to_s' do
      let(:other) { described_class.new(string) }

      it('is true') { is_expected.to be(true) }
    end

    context 'when other#to_s != name.to_s' do
      let(:other) { described_class.new("#{string}abc") }

      it('is false') { is_expected.to be(false) }
    end
  end

  describe '#capitalize' do
    subject(:capitalize) { name.capitalize }

    context 'when the initial string is all lowercase' do
      let(:string) { 'louisiana' }

      it 'is a capitalized version of the name' do
        is_expected.to eq('Louisiana')
      end
    end

    context 'when the initial string is all uppercase' do
      let(:string) { 'LOUISIANA' }

      it 'is a capitalized version of the name' do
        is_expected.to eq('Louisiana')
      end
    end

    context 'when the initial string has random case' do
      let(:string) { 'lOuIsianA' }

      it 'is a capitalized version of the name' do
        is_expected.to eq('Louisiana')
      end
    end
  end

  describe '#lowercase' do
    subject(:lowercase) { name.lowercase }

    context 'when the initial string is all lowercase' do
      let(:string) { 'louisiana' }

      it 'is a lowercase version of the name' do
        is_expected.to eq('louisiana')
      end
    end

    context 'when the initial string is all uppercase' do
      let(:string) { 'LOUISIANA' }

      it 'is a lowercase version of the name' do
        is_expected.to eq('louisiana')
      end
    end

    context 'when the initial string has random case' do
      let(:string) { 'lOuIsianA' }

      it 'is a lowercase version of the name' do
        is_expected.to eq('louisiana')
      end
    end
  end

  describe '#to_s' do
    subject(:to_s) { name.to_s }

    context 'when the initial string is all lowercase' do
      let(:string) { 'louisiana' }

      it 'is a capitalized version of the name' do
        is_expected.to eq('Louisiana')
      end
    end

    context 'when the initial string is all uppercase' do
      let(:string) { 'LOUISIANA' }

      it 'is a capitalized version of the name' do
        is_expected.to eq('Louisiana')
      end
    end

    context 'when the initial string has random case' do
      let(:string) { 'lOuIsianA' }

      it 'is a capitalized version of the name' do
        is_expected.to eq('Louisiana')
      end
    end
  end
end

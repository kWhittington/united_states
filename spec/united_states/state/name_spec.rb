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

  describe '#camel_case' do
    subject(:camel_case) { name.camel_case }

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

    context 'when the initial string is two lowercase words' do
      let(:string) { 'north dakota' }

      it 'is a leading lowercase, capitalized version of each word, '\
         'with no separators' do
        is_expected.to eq('northDakota')
      end
    end

    context 'when the initial string is two uppercase words' do
      let(:string) { 'NORTH DAKOTA' }

      it 'is a leading lowercase, capitalized version of each word, '\
         'with no separators' do
        is_expected.to eq('northDakota')
      end
    end

    context 'when the initial string is two random case words' do
      let(:string) { 'NoRtH DakoTA' }

      it 'is a leading lowercase, capitalized version of each word, '\
         'with no separators' do
        is_expected.to eq('northDakota')
      end
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

    context 'when the initial string is two lowercase words' do
      let(:string) { 'north dakota' }

      it 'is a capitalized version of the name, separated by spaces' do
        is_expected.to eq('North Dakota')
      end
    end

    context 'when the initial string is two uppercase words' do
      let(:string) { 'NORTH DAKOTA' }

      it 'is a capitalized version of the name, separated by spaces' do
        is_expected.to eq('North Dakota')
      end
    end

    context 'when the initial string is two random case words' do
      let(:string) { 'NoRtH DakoTA' }

      it 'is a capitalized version of the name, separated by spaces' do
        is_expected.to eq('North Dakota')
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

    context 'when the initial string is two lowercase words' do
      let(:string) { 'north dakota' }

      it 'is a lowercase version of the name, separated by spaces' do
        is_expected.to eq('north dakota')
      end
    end

    context 'when the initial string is two uppercase words' do
      let(:string) { 'NORTH DAKOTA' }

      it 'is a lowercase version of the name, separated by spaces' do
        is_expected.to eq('north dakota')
      end
    end

    context 'when the initial string is two random case words' do
      let(:string) { 'NoRtH DakoTA' }

      it 'is a lowercase version of the name, separated by spaces' do
        is_expected.to eq('north dakota')
      end
    end
  end

  describe '#pascal_case' do
    subject(:pascal) { name.pascal_case }

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

    context 'when the initial string is two lowercase words' do
      let(:string) { 'north dakota' }

      it 'is a capitalized version of each word, with no separators' do
        is_expected.to eq('NorthDakota')
      end
    end

    context 'when the initial string is two uppercase words' do
      let(:string) { 'NORTH DAKOTA' }

      it 'is a capitalized version of each word, with no separators' do
        is_expected.to eq('NorthDakota')
      end
    end

    context 'when the initial string is two random case words' do
      let(:string) { 'NoRtH DakoTA' }

      it 'is a capitalized version of each word, with no separators' do
        is_expected.to eq('NorthDakota')
      end
    end
  end

  describe '#screaming_snake_case' do
    subject(:screaming_snake_case) { name.screaming_snake_case }

    context 'when the initial string is one lowercase word' do
      let(:string) { 'louisiana' }

      it 'is an all uppercase version of the name' do
        is_expected.to eq('LOUISIANA')
      end
    end

    context 'when the initial string is one uppercase word' do
      let(:string) { 'LOUISIANA' }

      it 'is an all uppercase version of the name' do
        is_expected.to eq('LOUISIANA')
      end
    end

    context 'when the initial string is one random case word' do
      let(:string) { 'lOuIsianA' }

      it 'is an all uppercase version of the name' do
        is_expected.to eq('LOUISIANA')
      end
    end

    context 'when the initial string is two lowercase words' do
      let(:string) { 'north dakota' }

      it 'is an all uppercase version of the name, separated by underscores' do
        is_expected.to eq('NORTH_DAKOTA')
      end
    end

    context 'when the initial string is two uppercase words' do
      let(:string) { 'NORTH DAKOTA' }

      it 'is an all uppercase version of the name, separated by underscores' do
        is_expected.to eq('NORTH_DAKOTA')
      end
    end

    context 'when the initial string is two random case words' do
      let(:string) { 'NoRtH DakoTA' }

      it 'is an all uppercase version of the name, separated by underscores' do
        is_expected.to eq('NORTH_DAKOTA')
      end
    end
  end

  describe '#snake_case' do
    subject(:snake_case) { name.snake_case }

    context 'when the initial string is one lowercase word' do
      let(:string) { 'louisiana' }

      it 'is a lowercase version of the name' do
        is_expected.to eq('louisiana')
      end
    end

    context 'when the initial string is one uppercase word' do
      let(:string) { 'LOUISIANA' }

      it 'is a lowercase version of the name' do
        is_expected.to eq('louisiana')
      end
    end

    context 'when the initial string is one random case word' do
      let(:string) { 'lOuIsianA' }

      it 'is a lowercase version of the name' do
        is_expected.to eq('louisiana')
      end
    end

    context 'when the initial string is two lowercase words' do
      let(:string) { 'north dakota' }

      it 'is a lowercase version of the name, separated by underscores' do
        is_expected.to eq('north_dakota')
      end
    end

    context 'when the initial string is two uppercase words' do
      let(:string) { 'NORTH DAKOTA' }

      it 'is a lowercase version of the name, separated by underscores' do
        is_expected.to eq('north_dakota')
      end
    end

    context 'when the initial string is two random case words' do
      let(:string) { 'NoRtH DakoTA' }

      it 'is a lowercase version of the name, separated by underscores' do
        is_expected.to eq('north_dakota')
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

    context 'when the initial string is two lowercase words' do
      let(:string) { 'north dakota' }

      it 'is a capitalized version of the name, separated by underscores' do
        is_expected.to eq('North Dakota')
      end
    end

    context 'when the initial string is two uppercase words' do
      let(:string) { 'NORTH DAKOTA' }

      it 'is a capitalized version of the name, separated by underscores' do
        is_expected.to eq('North Dakota')
      end
    end

    context 'when the initial string is two random case words' do
      let(:string) { 'NoRtH DakoTA' }

      it 'is a capitalized version of the name, separated by underscores' do
        is_expected.to eq('North Dakota')
      end
    end
  end
end

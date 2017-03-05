# frozen_string_literal: true
require 'spec_helper'
require 'united_states/state/government_printing_office_abbreviation'

RSpec.describe UnitedStates::State::GovernmentPrintingOfficeAbbreviation do
  subject :government_printing_office_abbreviation do
    described_class.new(string)
  end

  let(:string) { 'Wis.' }

  describe '#capitalize' do
    subject :capitalize do
      government_printing_office_abbreviation.capitalize
    end

    let :government_printing_office_abbreviation do
      described_class.new(string)
    end

    context 'when the given string is all lowercase' do
      let(:string) { 'ohio' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('Ohio')
      end
    end

    context 'when the given string is all uppercase' do
      let(:string) { 'mont.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('Mont.')
      end
    end

    context 'when the given string has random case' do
      let(:string) { 'kANs.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('Kans.')
      end
    end

    context 'when the given string is two lowercase words' do
      let(:string) { 'n. mex.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('N. Mex.')
      end
    end

    context 'when the given string is two uppercase words' do
      let(:string) { 'N. DAK.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('N. Dak.')
      end
    end

    context 'when the given string is two random case words' do
      let(:string) { 'W. vA.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('W. Va.')
      end
    end

    context 'when the given string is two single character words' do
      let(:string) { 'n.y.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('N.Y.')
      end
    end
  end

  describe '#lowercase' do
    subject :lowercase do
      government_printing_office_abbreviation.lowercase
    end

    let :government_printing_office_abbreviation do
      described_class.new(string)
    end

    context 'when the given string is all lowercase' do
      let(:string) { 'ohio' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('ohio')
      end
    end

    context 'when the given string is all uppercase' do
      let(:string) { 'mont.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('mont.')
      end
    end

    context 'when the given string has random case' do
      let(:string) { 'kANs.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('kans.')
      end
    end

    context 'when the given string is two lowercase words' do
      let(:string) { 'n. mex.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('n. mex.')
      end
    end

    context 'when the given string is two uppercase words' do
      let(:string) { 'N. DAK.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('n. dak.')
      end
    end

    context 'when the given string is two random case words' do
      let(:string) { 'W. vA.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('w. va.')
      end
    end

    context 'when the given string is two single character words' do
      let(:string) { 'n.y.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('n.y.')
      end
    end
  end

  describe '#snake_case' do
    subject :snake_case do
      government_printing_office_abbreviation.snake_case
    end

    let :government_printing_office_abbreviation do
      described_class.new(string)
    end

    context 'when the given string is all lowercase' do
      let(:string) { 'ohio' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('ohio')
      end
    end

    context 'when the given string is all uppercase' do
      let(:string) { 'mont.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('mont')
      end
    end

    context 'when the given string has random case' do
      let(:string) { 'kANs.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('kans')
      end
    end

    context 'when the given string is two lowercase words' do
      let(:string) { 'n. mex.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('n_mex')
      end
    end

    context 'when the given string is two uppercase words' do
      let(:string) { 'N. DAK.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('n_dak')
      end
    end

    context 'when the given string is two random case words' do
      let(:string) { 'W. vA.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('w_va')
      end
    end

    context 'when the given string is two single character words' do
      let(:string) { 'n.y.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('n_y')
      end
    end
  end

  describe '#to_s' do
    subject(:to_s) { government_printing_office_abbreviation.to_s }
    let :government_printing_office_abbreviation do
      described_class.new(string)
    end

    context 'when the given string is all lowercase' do
      let(:string) { 'ohio' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('Ohio')
      end
    end

    context 'when the given string is all uppercase' do
      let(:string) { 'mont.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('Mont.')
      end
    end

    context 'when the given string has random case' do
      let(:string) { 'kANs.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('Kans.')
      end
    end

    context 'when the given string is two lowercase words' do
      let(:string) { 'n. mex.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('N. Mex.')
      end
    end

    context 'when the given string is two uppercase words' do
      let(:string) { 'N. DAK.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('N. Dak.')
      end
    end

    context 'when the given string is two random case words' do
      let(:string) { 'W. vA.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('W. Va.')
      end
    end

    context 'when the given string is two single character words' do
      let(:string) { 'n.y.' }

      it 'is a capitalized version of the abbreviation' do
        is_expected.to eq('N.Y.')
      end
    end
  end
end

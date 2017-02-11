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
          name: 'alabama', postal_code: 'al'),
        UnitedStates::State::Designation.new(
          name: 'alaska', postal_code: 'ak'),
        UnitedStates::State::Designation.new(
          name: 'arizona', postal_code: 'az'),
        UnitedStates::State::Designation.new(
          name: 'arkansas', postal_code: 'ar'),
        UnitedStates::State::Designation.new(
          name: 'california', postal_code: 'ca'),
        UnitedStates::State::Designation.new(
          name: 'colorado', postal_code: 'co'),
        UnitedStates::State::Designation.new(
          name: 'connecticut', postal_code: 'ct'),
        UnitedStates::State::Designation.new(
          name: 'delaware', postal_code: 'de'),
        UnitedStates::State::Designation.new(
          name: 'florida', postal_code: 'fl'),
        UnitedStates::State::Designation.new(
          name: 'georgia', postal_code: 'ga'),
        UnitedStates::State::Designation.new(
          name: 'hawaii', postal_code: 'hi'),
        UnitedStates::State::Designation.new(
          name: 'idaho', postal_code: 'id'),
        UnitedStates::State::Designation.new(
          name: 'illinois', postal_code: 'il'),
        UnitedStates::State::Designation.new(
          name: 'indiana', postal_code: 'in'),
        UnitedStates::State::Designation.new(
          name: 'iowa', postal_code: 'ia'),
        UnitedStates::State::Designation.new(
          name: 'kansas', postal_code: 'ks'),
        UnitedStates::State::Designation.new(
          name: 'kentucky', postal_code: 'ky'),
        UnitedStates::State::Designation.new(
          name: 'louisiana', postal_code: 'la'),
        UnitedStates::State::Designation.new(
          name: 'maine', postal_code: 'me'),
        UnitedStates::State::Designation.new(
          name: 'maryland', postal_code: 'md'),
        UnitedStates::State::Designation.new(
          name: 'massachusetts', postal_code: 'ma'),
        UnitedStates::State::Designation.new(
          name: 'michigan', postal_code: 'mi'),
        UnitedStates::State::Designation.new(
          name: 'minnesota', postal_code: 'mn'),
        UnitedStates::State::Designation.new(
          name: 'mississippi', postal_code: 'ms'),
        UnitedStates::State::Designation.new(
          name: 'missouri', postal_code: 'mo'),
        UnitedStates::State::Designation.new(
          name: 'montana', postal_code: 'mt'),
        UnitedStates::State::Designation.new(
          name: 'nebraska', postal_code: 'ne'),
        UnitedStates::State::Designation.new(
          name: 'nevada', postal_code: 'nv'),
        UnitedStates::State::Designation.new(
          name: 'new hampshire', postal_code: 'nh'),
        UnitedStates::State::Designation.new(
          name: 'new jersey', postal_code: 'nj'),
        UnitedStates::State::Designation.new(
          name: 'new mexico', postal_code: 'nm'),
        UnitedStates::State::Designation.new(
          name: 'new york', postal_code: 'ny'),
        UnitedStates::State::Designation.new(
          name: 'north carolina', postal_code: 'nc'),
        UnitedStates::State::Designation.new(
          name: 'north dakota', postal_code: 'nd'),
        UnitedStates::State::Designation.new(
          name: 'ohio', postal_code: 'oh'),
        UnitedStates::State::Designation.new(
          name: 'oklahoma', postal_code: 'ok'),
        UnitedStates::State::Designation.new(
          name: 'oregon', postal_code: 'or'),
        UnitedStates::State::Designation.new(
          name: 'pennsylvania', postal_code: 'pa'),
        UnitedStates::State::Designation.new(
          name: 'rhode island', postal_code: 'ri'),
        UnitedStates::State::Designation.new(
          name: 'south carolina', postal_code: 'sc'),
        UnitedStates::State::Designation.new(
          name: 'south dakota', postal_code: 'sd'),
        UnitedStates::State::Designation.new(
          name: 'tennessee', postal_code: 'tn'),
        UnitedStates::State::Designation.new(
          name: 'texas', postal_code: 'tx'),
        UnitedStates::State::Designation.new(
          name: 'utah', postal_code: 'ut'),
        UnitedStates::State::Designation.new(
          name: 'vermont', postal_code: 'vt'),
        UnitedStates::State::Designation.new(
          name: 'virginia', postal_code: 'va'),
        UnitedStates::State::Designation.new(
          name: 'washington', postal_code: 'wa'),
        UnitedStates::State::Designation.new(
          name: 'west virginia', postal_code: 'wv'),
        UnitedStates::State::Designation.new(
          name: 'wisconsin', postal_code: 'wi'),
        UnitedStates::State::Designation.new(
          name: 'wyoming', postal_code: 'wy'))
    end
  end
  # rubocop: enable RSpec/ExampleLength

  describe '.find_by_name(name)' do
    subject(:find_by_name) { described_class.find_by_name(name) }

    context 'when searching with a lowercase state name' do
      let(:name) { 'mississippi' }

      it 'is a Designation with matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'MISSISSIPPI', postal_code: 'MS'))
      end
    end

    context 'when searching with an uppercase state name' do
      let(:name) { 'TENNESSEE' }

      it 'is a Designation with matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'tennessee', postal_code: 'tn'))
      end
    end

    context 'when searching with a mixed case state name' do
      let(:name) { 'tExAs' }

      it 'is a Designation with matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'TexAs', postal_code: 'tx'))
      end
    end

    context 'when searching with a non-state name' do
      let(:name) { 'kevin' }

      it 'raises a UnitedStates::NoDesignationFoundError' do
        expect { find_by_name }.to raise_error(
          UnitedStates::NoDesignationFoundError,
          'No State named, "Kevin," was found.')
      end
    end

    context 'when searching with a symbolized, lowercase state name' do
      let(:name) { :mississippi }

      it 'is a Designation with matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'MISSISSIPPI', postal_code: 'MS'))
      end
    end

    context 'when searching with a symbolized, uppercase state name' do
      let(:name) { :TENNESSEE }

      it 'is a Designation with matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'tennessee', postal_code: 'tn'))
      end
    end

    context 'when searching with a symbolized, mixed case state name' do
      let(:name) { :tExAs }

      it 'is a Designation with matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'TexAs', postal_code: 'tx'))
      end
    end

    context 'when searching with a symbolized, non-state name' do
      let(:name) { :kevin }

      it 'raises a UnitedStates::NoDesignationFoundError' do
        expect { find_by_name }.to raise_error(
          UnitedStates::NoDesignationFoundError,
          'No State named, "Kevin," was found.')
      end
    end
  end

  describe '.find_by_postal_code(postal_code)' do
    subject :find_by_postal_code do
      described_class.find_by_postal_code(postal_code)
    end

    context 'when searching with a lowercase postal code' do
      let(:postal_code) { 'ms' }

      it 'is a Designation with matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'MISSISSIPPI', postal_code: 'MS'))
      end
    end

    context 'when searching with an uppercase state postal code' do
      let(:postal_code) { 'TN' }

      it 'is a Designation with matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'tennessee', postal_code: 'tn'))
      end
    end

    context 'when searching with a mixed case state postal code' do
      let(:postal_code) { 'tX' }

      it 'is a Designation with matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'TexAs', postal_code: 'tx'))
      end
    end

    context 'when searching with a non-state postal code' do
      let(:postal_code) { 'ZZ' }

      it 'raises a UnitedStates::NoDesignationFoundError' do
        expect { find_by_postal_code }.to raise_error(
          UnitedStates::NoDesignationFoundError,
          'No State with postal code, "ZZ," was found.')
      end
    end

    context 'when searching with a symbolized, lowercase postal code' do
      let(:postal_code) { :ms }

      it 'is a Designation with matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'MISSISSIPPI', postal_code: 'MS'))
      end
    end

    context 'when searching with a symbolized, uppercase state postal code' do
      let(:postal_code) { :TN }

      it 'is a Designation with matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'tennessee', postal_code: 'tn'))
      end
    end

    context 'when searching with a symbolized, mixed case state postal code' do
      let(:postal_code) { :tX }

      it 'is a Designation with matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'TexAs', postal_code: 'tx'))
      end
    end

    context 'when searching with a symbolized, non-state postal code' do
      let(:postal_code) { :ZZ }

      it 'raises a UnitedStates::NoDesignationFoundError' do
        expect { find_by_postal_code }.to raise_error(
          UnitedStates::NoDesignationFoundError,
          'No State with postal code, "ZZ," was found.')
      end
    end
  end

  describe '.names' do
    subject(:names) { described_class.names }

    it('contains 50 state names') { expect(names.count).to eq(50) }

    it "contains each state designation's name" do
      is_expected.to match_array(described_class.all.map(&:name))
    end
  end

  describe '.postal_codes' do
    subject(:postal_codes) { described_class.postal_codes }

    it('contains 50 designations') { expect(postal_codes.count).to eq(50) }

    it 'contains each state postal code' do
      is_expected.to match_array(described_class.all.map(&:postal_code))
    end
  end
end

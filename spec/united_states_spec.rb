# frozen_string_literal: true

require 'pathname'
require 'spec_helper'
require 'united_states'

RSpec.describe UnitedStates do
  it 'has a version number' do
    expect(UnitedStates::VERSION).not_to be_nil
  end

  it 'loads UnitedStates::State::Name' do
    expect(UnitedStates::State::Name).not_to be_nil
  end

  describe '.[](name_or_postal_code)' do
    subject(:index) { described_class[name_or_postal_code] }

    context 'when searching with a lowercase name string' do
      let(:name_or_postal_code) { 'louisiana' }

      it 'is a Designation with a matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'LOUISIANA', postal_code: 'LA'))
      end
    end

    context 'when searching with an uppercase name string' do
      let(:name_or_postal_code) { 'LOUISIANA' }

      it 'is a Designation with a matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'louisiana', postal_code: 'la'))
      end
    end

    context 'when searching with a mixed case name string' do
      let(:name_or_postal_code) { 'LouIsiAna' }

      it 'is a Designation with a matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'louISiaNA', postal_code: 'lA'))
      end
    end

    context 'when searching with a non-state name string' do
      let(:name_or_postal_code) { 'car' }

      it 'raises UnitedStates::NoDesignationFoundError' do
        expect { index }.to raise_error(
          UnitedStates::NoDesignationFoundError,
          'No State named, "Car," was found.')
      end
    end

    context 'when searching with a symbolized, lowercase name' do
      let(:name_or_postal_code) { :louisiana }

      it 'is a Designation with a matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'LOUISIANA', postal_code: 'LA'))
      end
    end

    context 'when searching with a symbolized, uppercase name' do
      let(:name_or_postal_code) { :LOUISIANA }

      it 'is a Designation with a matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'louisiana', postal_code: 'la'))
      end
    end

    context 'when searching with a symbolized, mixed case name' do
      let(:name_or_postal_code) { :LouIsiAna }

      it 'is a Designation with a matching #name, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'louISiaNA', postal_code: 'lA'))
      end
    end

    context 'when searching with a symbolized non-state name' do
      let(:name_or_postal_code) { :car }

      it 'raises UnitedStates::NoDesignationFoundError' do
        expect { index }.to raise_error(
          UnitedStates::NoDesignationFoundError,
          'No State named, "Car," was found.')
      end
    end

    context 'when searching with a lowercase postal code string' do
      let(:name_or_postal_code) { 'ms' }

      it 'is a Designation with a matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'MISSISSIPPI', postal_code: 'MS'))
      end
    end

    context 'when searching with an uppercase postal code string' do
      let(:name_or_postal_code) { 'MS' }

      it 'is a Designation with a matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'mississippi', postal_code: 'ms'))
      end
    end

    context 'when searching with a mixed case postal code string' do
      let(:name_or_postal_code) { 'Ms' }

      it 'is a Designation with a matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'misSIssIpPi', postal_code: 'mS'))
      end
    end

    context 'when searching with a non-state postal code string' do
      let(:name_or_postal_code) { 'cx' }

      it 'raises UnitedStates::NoDesignationFoundError' do
        expect { index }.to raise_error(
          UnitedStates::NoDesignationFoundError,
          'No State with postal code, "CX," was found.')
      end
    end

    context 'when searching with a symbolized, lowercase postal code' do
      let(:name_or_postal_code) { :ms }

      it 'is a Designation with a matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'MISSISSIPPI', postal_code: 'MS'))
      end
    end

    context 'when searching with a symbolized, uppercase postal code' do
      let(:name_or_postal_code) { :MS }

      it 'is a Designation with a matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'mississippi', postal_code: 'ms'))
      end
    end

    context 'when searching with a symbolized, mixed case postal code' do
      let(:name_or_postal_code) { :Ms }

      it 'is a Designation with a matching #postal_code, ignoring case' do
        is_expected.to eq(
          UnitedStates::State::Designation.new(
            name: 'misSIssIpPi', postal_code: 'mS'))
      end
    end

    context 'when searching with a symbolized, non-state postal code' do
      let(:name_or_postal_code) { :cx }

      it 'raises UnitedStates::NoDesignationFoundError' do
        expect { index }.to raise_error(
          UnitedStates::NoDesignationFoundError,
          'No State with postal code, "CX," was found.')
      end
    end
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

  describe '.array_from_hashes(hashes)' do
    context 'when hashes is empty' do
      subject(:array_from_hashes) { described_class.array_from_hashes }

      it('is an Array') { is_expected.to be_an(Array) }
      it('is empty') { is_expected.to be_empty }
    end

    context 'when hashes has one hash in it' do
      subject(:array_from_hashes) { described_class.array_from_hashes(hash) }

      let(:hash) { { name: 'louisiana', postal_code: 'la' } }

      it('is an Array') { is_expected.to be_an(Array) }

      it 'includes a UnitedStates::State::Designation from the hash' do
        is_expected.to include(
          UnitedStates::State::Designation.new(
            name: 'LOUISIANA', postal_code: 'LA'))
      end
    end

    context 'when hashes has multiple hashes in it' do
      subject :array_from_hashes do
        described_class.array_from_hashes(florida_hash, mississippi_hash)
      end

      let(:florida_hash) { { name: 'FlorIDA', postal_code: 'fL' } }
      let(:mississippi_hash) { { name: 'Mississippi', postal_code: 'Ms' } }

      it('is an Array') { is_expected.to be_an(Array) }

      it 'includes a UnitedStates::State::Designation for each' do
        is_expected.to contain_exactly(
          UnitedStates::State::Designation.new(
            name: 'florida', postal_code: 'fl'),
          UnitedStates::State::Designation.new(
            name: 'mississippi', postal_code: 'ms'))
      end
    end
  end

  # rubocop: disable Style/IndentHeredoc
  describe '.array_from_yaml(yaml)' do
    subject(:array_from_yaml) { described_class.array_from_yaml(yaml) }

    context 'when the yaml has no name' do
      let :yaml do
        <<-YAML
---
        YAML
      end

      it('is an empty Array') { is_expected.to be_empty }
    end

    context 'when the yaml has no postal codes' do
      let :yaml do
        <<-YAML
---
Louisiana:
        YAML
      end

      it 'raises UnitedStates::State::PostalCode::StringTooShortError' do
        expect { array_from_yaml }.to raise_error(
          UnitedStates::State::PostalCode::StringTooShortError,
          ' too short, postal codes must be 2 characters')
      end
    end

    context 'when the yaml has a postal code over 2 characters' do
      let :yaml do
        <<-YAML
---
Louisiana:
  postal_code: LOUS
        YAML
      end

      it 'raises UnitedStates::State::PostalCode::StringTooLongError' do
        expect { array_from_yaml }.to raise_error(
          UnitedStates::State::PostalCode::StringTooLongError,
          'LOUS too long, postal codes must be 2 characters')
      end
    end

    context 'when the yaml includes postal code info' do
      let :yaml do
        <<-YAML
---
New York:
  postal_code: NY
        YAML
      end

      it 'is an Array with a matching name and postal code' do
        is_expected.to contain_exactly(
          UnitedStates::State::Designation.new(
            name: 'new york', postal_code: 'ny'))
      end
    end

    context 'when the yaml has multiple designations defined' do
      let :yaml do
        <<-YAML
---
Maine:
  postal_code: ME
Wisconsin:
  postal_code: WI
        YAML
      end

      it 'is an Array with matching designations' do
        is_expected.to contain_exactly(
          UnitedStates::State::Designation.new(
            name: 'maine', postal_code: 'me'),
          UnitedStates::State::Designation.new(
            name: 'WISCONSIN', postal_code: 'WI'))
      end
    end
  end

  describe '.array_from_yaml_file(path:)' do
    subject :array_from_yaml_file do
      described_class.array_from_yaml_file(path: path)
    end

    let(:pathname) { Pathname.new(path) }

    context 'when no file exists at the given path' do
      let(:path) { './tmp/does_not_exist.yml' }

      before do
        Pathname.new(path).delete if Pathname.new(path).exist?
      end

      it 'raises "#{path} does not exist."' do
        expect { array_from_yaml_file }.to raise_error(
          "\"./tmp/does_not_exist.yml\" does not exist.\n"\
          'Please supply a path to a YAML file.')
      end
    end

    context 'when the file is empty' do
      let(:path) { './tmp/states.yml' }

      let :yaml do
        <<-YAML
---
        YAML
      end

      before { pathname.binwrite(yaml) }

      after { pathname.delete if pathname.exist? }

      it('is an empty Array') { is_expected.to be_empty }
    end

    context 'when the file has no postal code' do
      let(:path) { './tmp/states.yml' }

      let :yaml do
        <<-YAML
---
Louisiana:
        YAML
      end

      before { pathname.binwrite(yaml) }

      after { pathname.delete if pathname.exist? }

      it 'raises UnitedStates::State::PostalCode::StringTooShortError' do
        expect { array_from_yaml_file }.to raise_error(
          UnitedStates::State::PostalCode::StringTooShortError,
          ' too short, postal codes must be 2 characters')
      end
    end

    context 'when the file has a postal code over 2 characters' do
      let(:path) { './tmp/states.yml' }

      let :yaml do
        <<-YAML
---
Louisiana:
  postal_code: LOUS
        YAML
      end

      before { pathname.binwrite(yaml) }

      after { pathname.delete if pathname.exist? }

      it 'raises UnitedStates::State::PostalCode::StringTooLongError' do
        expect { array_from_yaml_file }.to raise_error(
          UnitedStates::State::PostalCode::StringTooLongError,
          'LOUS too long, postal codes must be 2 characters')
      end
    end

    context 'when the file includes postal code info' do
      let(:path) { './tmp/states.yml' }

      let :yaml do
        <<-YAML
---
New York:
  postal_code: NY
        YAML
      end

      before { pathname.binwrite(yaml) }

      after { pathname.delete if pathname.exist? }

      it 'is an Array with a matching name and postal code' do
        is_expected.to contain_exactly(
          UnitedStates::State::Designation.new(
            name: 'new york', postal_code: 'ny'))
      end
    end

    context 'when the file has multiple designations defined' do
      let(:path) { './tmp/states.yml' }

      let :yaml do
        <<-YAML
---
Maine:
  postal_code: ME
Wisconsin:
  postal_code: WI
        YAML
      end

      before { pathname.binwrite(yaml) }

      after { pathname.delete if pathname.exist? }

      it 'is an Array with matching designations' do
        is_expected.to contain_exactly(
          UnitedStates::State::Designation.new(
            name: 'maine', postal_code: 'me'),
          UnitedStates::State::Designation.new(
            name: 'WISCONSIN', postal_code: 'WI'))
      end
    end
  end
  # rubocop: enable Style/IndentHeredoc

  describe '.config_path' do
    subject(:config_path) { described_class.config_path }

    it 'is "./lib/united_states/designations.yml"' do
      is_expected.to eq('./lib/united_states/designations.yml')
    end
  end

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

# frozen_string_literal: true
require 'spec_helper'
require 'united_states/array'

RSpec.describe UnitedStates::Array do
  describe '.from_hashes(*hashes)' do
    context 'when hashes is empty' do
      subject(:from_hashes) { described_class.from_hashes }

      it('is an Array') { is_expected.to be_an(Array) }
      it('is empty') { is_expected.to be_empty }
    end

    context 'when hashes has one has in it' do
      subject(:from_hashes) { described_class.from_hashes(hash) }
      let(:hash) { { name: 'LOUISIANA', postal_code: 'LA' } }

      it('is an Array') { is_expected.to be_an(Array) }

      it 'contains a UnitedStates::State::Designation from the hash' do
        is_expected.to contain_exactly(
          UnitedStates::State::Designation.new(
            name: 'louisiana', postal_code: 'la'))
      end
    end

    context 'when hashes has multiple hashes in it' do
      subject :from_hashes do
        described_class.from_hashes(maine_hash, vermont_hash)
      end

      let(:maine_hash) { { name: 'Maine', postal_code: 'ME' } }
      let(:vermont_hash) { { name: 'Vermont', postal_code: 'VT' } }

      it('is an Array') { is_expected.to be_an(Array) }

      it 'contains a UnitedStates::State::Designation for each hash' do
        is_expected.to contain_exactly(
          UnitedStates::State::Designation.new(
            name: 'MAINE', postal_code: 'ME'),
          UnitedStates::State::Designation.new(
            name: 'VERMONT', postal_code: 'VT'))
      end
    end
  end

  describe '.from_yaml(yaml)' do
    subject(:from_yaml) { described_class.from_yaml(yaml) }

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
        expect { from_yaml }.to raise_error(
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
        expect { from_yaml }.to raise_error(
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

  describe '.from_yaml_file(path:)' do
    subject :from_yaml_file do
      described_class.from_yaml_file(path: path)
    end

    let(:pathname) { Pathname.new(path) }

    context 'when no file exists at the given path' do
      let(:path) { './tmp/does_not_exist.yml' }

      before do
        Pathname.new(path).delete if Pathname.new(path).exist?
      end

      it 'raises "#{path} does not exist."' do
        expect { from_yaml_file }.to raise_error(
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
        expect { from_yaml_file }.to raise_error(
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
        expect { from_yaml_file }.to raise_error(
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
end

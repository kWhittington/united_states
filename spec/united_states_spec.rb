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
end

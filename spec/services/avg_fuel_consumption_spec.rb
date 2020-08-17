# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AvgFuelConsumption, type: :service do
  subject { described_class.new(**params) }
  describe '#count' do
    let(:params) do
      {
        liters:     10,
        kilometers: 100
      }
    end

    it 'returns nil when one of params is nil' do
      params[:liters] = nil
      expect(subject.count).to be_nil

      params[:kilometers] = nil
      expect(subject.count).to be_nil
    end

    it 'returns nil when one of params is blank' do
      params[:kilometers] = ''
      expect(subject.count).to be_nil
    end

    it 'returns nil when one of params is string' do
      params[:kilometers] = 'asdf'
      expect(subject.count).to be_nil
    end

    it 'returns float' do
      expect(subject.count).to eq 10.0
    end

    it 'converts string params to float and returns float' do
      params = {
        liters:     '10',
        kilometers: '100'
      }

      expect(subject.count).to eq 10.0
    end
  end
end

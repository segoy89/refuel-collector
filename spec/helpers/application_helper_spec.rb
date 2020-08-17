# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#set_color_by' do
    it 'returns green for `notice`' do
      expect(helper.set_color_by('notice')).to eq 'green'
    end

    it 'returns green for `success`' do
      expect(helper.set_color_by('notice')).to eq 'green'
    end

    it 'returns red for `alert`' do
      expect(helper.set_color_by('alert')).to eq 'red'
    end
  end
end

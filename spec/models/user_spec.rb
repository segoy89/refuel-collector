# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns `light_theme` as default theme_color' do
    expect(subject.theme_color).to eq 'light_theme'
  end

  describe '#change_theme_color' do
    let!(:user) { create(:user) }

    it 'changes the theme color to opposite' do
      user.change_theme_color
      expect(user.reload.theme_color).to eq 'dark_theme'

      user.change_theme_color
      expect(user.reload.theme_color).to eq 'light_theme'
    end
  end
end

# frozen_string_literal: true

class ThemeReflex < ApplicationReflex
  def switch_color
    current_user.change_theme_color

    emoticon = current_user.light_theme? ? '☾' : '☀'

    morph '#switchTheme', emoticon
  end
end

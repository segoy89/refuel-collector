module ApplicationHelper
  def set_color_by(type)
    case type
    when 'notice'
      'green'
    when 'alert'
      'red'
    end
  end
end

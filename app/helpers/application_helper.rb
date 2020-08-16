module ApplicationHelper
  def set_color_by(type)
    case type
    when 'notice', 'success'
      'green'
    when 'alert'
      'red'
    end
  end
end

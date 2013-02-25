module ApplicationHelper
  def language_selector
    if I18n.locale == :"en-US"
      link_to 'zh-CN', url_for(:locale => 'zh-CN')
    else
      link_to 'en-US', url_for(:locale => 'en-US')
    end
  end
  
  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end
end

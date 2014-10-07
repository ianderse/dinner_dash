module ItemsHelper

  def non_active_style(item)
    css_class = "not_active" if !item.active?
  end

end

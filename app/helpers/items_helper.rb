module ItemsHelper

  def print_price(price)
    number_to_currency price
  end

  def non_active_style(item)
    css_class = "not_active" if !item.active?
  end

end

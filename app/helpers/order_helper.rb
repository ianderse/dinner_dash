module OrderHelper

  def order_price(items)
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end

  def custom_format(time)
    to_datetime(time)
  end

end

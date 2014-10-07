module OrderHelper

  def order_price(items)
    total = 0
    items.each do |item|
      total += (item.price * items.size)
    end
    total
  end

end

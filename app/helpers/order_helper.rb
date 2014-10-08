module OrderHelper

  def order_price(items)
    total = 0
    items.each do |item|
      total += (item.price * items.size)
    end
    total
  end

  def pay(order)
    !@order.status == 'paid'
  end

  def cancel(order)
    !@order.status == 'cancelled'
  end

  def complete(order)
    !@order.status == 'completed'
  end

  # def mark_paid(items)
  #   items.paid? ? 'ordered' : 'paid'
  # end

end

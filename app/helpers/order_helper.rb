module OrderHelper

  def self.order_price
    items.each do |item|
      (item.price * item.quantity).reduce
    end
  end

end

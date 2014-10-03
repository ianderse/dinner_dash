class Cart
  def self.build(session_cart)
    return [] unless session_cart
    session_cart.map { |id| Item.find(id) }
                .group_by(&:id)
                .values
  end
end

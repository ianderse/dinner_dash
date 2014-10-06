class Cart
  def self.build(session_cart)
    return [] unless session_cart
    session_cart.map { |id| Item.find(id) }
                .group_by(&:id)
                .values
    #think about storing item_id and quantity in the session[:cart] as a hash
  end
end

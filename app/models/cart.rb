class Cart
  attr_reader :items

  def initialize(items)
    @items = Array(items).map(&:to_i)
  end

  def items_to_quantities
    items.group_by { |id| id }
         .map { |id, ids| [Item.find(id), ids.size] }
  end

  def add_item(item_id, quantity:)
    items.concat [item_id.to_i] * quantity.to_i
  end

  def to_a
    items
  end

  def size
    items.size
  end

  def delete(item_id)
    items.delete item_id.to_i
  end

  def update_quantity(item_id, quantity:)
    delete item_id
    add_item item_id, quantity: quantity
  end
end

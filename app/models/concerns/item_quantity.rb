module ItemQuantity
  extend ActiveSupport::Concern

  def items_to_quantities
    items.group_by { |id| id }
         .map { |id, ids| [Item.find(id), ids.size] }
  end
end

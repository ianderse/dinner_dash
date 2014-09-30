class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  validates :item_id, presence: true
  validates :order_id, presence: true
end

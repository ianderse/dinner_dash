class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  validates :items, presence: true
  validates :user, presence: true
  validates :status, inclusion: { in: :statuses }
  validates :exchange, inclusion: { in: :exchanges }
  validates :street_number,
            :street,
            :city,
            presence: true, if: :delivery?
  validates :state, inclusion: US.states, if: :delivery?
  validates :zip, format: { with: /\d{5}\d*/ }, if: :delivery?

  def delivery?
    exchange == 'delivery'
  end

  def statuses
    ['ordered', 'completed', 'cancelled', 'paid']
  end

  def exchanges
    ['pickup', 'delivery']
  end

  def group_items
    items.group_by { |id| id }
         .map { |id, ids| [Item.find(id), ids.size] }
  end
end

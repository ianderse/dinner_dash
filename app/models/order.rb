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

  status_change :create_scopes => false do
    status :ordered, :initial => true
    status :completed
    status :cancelled
    status :paid
  end

  status_change do
    status :ordered, :initial => true
    status :completed
    status :cancelled
    status :paid

  event :pay do
    transitions :from => :ordered, :to => :paid
  end

  event :complete do
    transitions :from => :paid, :to => :completed
  end

  event :cancel do
    transitions :from => [:ordered, :paid], :to => :cancelled
  end
end

#helpers for events
#Controller (public send) with filter into order
#Model for events
#In view, create event

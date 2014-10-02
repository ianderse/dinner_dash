require_relative 'order_validators'

class Order < ActiveRecord::Base
  extend OrderValidators
  
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  validates :items, presence: true
  validates :user, presence: true
  validates :status, inclusion: %w(ordered completed cancelled paid)
  validates :exchange, inclusion: %w(pickup delivery)
  validates :street_number, 
            :street, 
            :city, 
            presence: true, if: "delivery?"
  validates :state, inclusion: states, if: "delivery?"
  validates :zip, format: { with: /\d{5}\d*/ }, if: "delivery?"

  def delivery?
    exchange == 'delivery'
  end
end

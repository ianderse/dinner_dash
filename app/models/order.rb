class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  validates :items, length: { minimum: 1 }
  validates :user, presence: true
  validates :exchange, inclusion: %w(pickup delivery)
  validates :street_number, :street, :city, :state, :zip, presence: true, if: Proc.new { |o| o.exchange == 'delivery' }
end

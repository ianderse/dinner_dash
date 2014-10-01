class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  validates :items, presence: true
  validates :user, presence: true
  validates :status, inclusion: %w(ordered completed cancelled paid)
  validates :exchange, inclusion: %w(pickup delivery)
  validates :street_number, :street, :city, :state, :zip, presence: true, if: Proc.new { |o| o.exchange == 'delivery' }
end

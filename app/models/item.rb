class Item < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
	validates :title, :description, presence: true
	validates :price, numericality: { greater_than: 0 }
end

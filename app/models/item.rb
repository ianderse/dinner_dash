class Item < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :price, numericality: { greater_than: 0 }
end

class ItemsController < ApplicationController
	load_and_authorize_resource

	def index
		@items = Item.active
		@categories = Category.all
	end

	def show
		@item = Item.find(params[:id])
		@reviews = Review.where(item_id: @item.id)
		#can move average to item model?
		@average = @reviews.map do |review|
									review.stars
								end
		@average = @average.reduce(:+) / @reviews.size

		@categories = @item.categories
	end
end

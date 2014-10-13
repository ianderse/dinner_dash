class ItemsController < ApplicationController
	load_and_authorize_resource

	def index
		@items = Item.active
		@categories = Category.all
	end

	def show
		@item = Item.find(params[:id])
		@reviews = Review.where(item_id: @item.id)
		#move average to item model?
		if !@reviews.empty?
			@average = @reviews.map do |review|
										review.stars
									end
			@average = ((@average.reduce(:+) / @reviews.size) * 2.0).round / 2.0
		else
			@average = 0
		end
		@categories = @item.categories
	end
end

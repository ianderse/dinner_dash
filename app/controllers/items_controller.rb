class ItemsController < ApplicationController
  load_and_authorize_resource

	def index
		@items = Item.active
		@categories = Category.all
	end

	def show
		@item = Item.find(params[:id])
		@reviews = Review.where(item_id: @item.id)
		if !@reviews.empty?
			@average = @item.average_rating
		else
			@average = 0
		end
		@categories = @item.categories
	end
end

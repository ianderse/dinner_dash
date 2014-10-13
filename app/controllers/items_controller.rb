class ItemsController < ApplicationController
	load_and_authorize_resource

	def index
		@items = Item.active
		@categories = Category.all
	end

	def show
		@item = Item.find(params[:id])
		@reviews = Review.where(item_id: @item.id)
		@categories = @item.categories
	end
end

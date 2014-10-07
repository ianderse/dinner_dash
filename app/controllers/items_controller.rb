class ItemsController < ApplicationController
	load_and_authorize_resource

	def index
		@items = Item.active
		@categories = Category.all
	end

	def show
		@item = Item.find(params[:id])
		@categories = @item.categories
	end
end

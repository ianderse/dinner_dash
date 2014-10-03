class ItemsController < ApplicationController
	load_and_authorize_resource

	def index
		@items = Item.all
		@categories = Category.all
	end

	def show
		@item = Item.find(params[:id])
		@categories = @item.categories
	end

	def new
		@item = Item.new
		@categories = Category.all
	end
end

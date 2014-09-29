class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
	end

	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to @item
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_url
	end

	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to @item
	end

	private

	def item_params
		params.require(:item).permit(:title, :description, :price)
	end
end

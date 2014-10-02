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

	def edit
		@item = Item.find(params[:id])
		@categories = Category.all
	end

	def create
		#refactor this
		@item = Item.new(item_params)
		@categories = params[:categories] || []
		@categories.each do |category|
			category = Category.find(category)
			@item.categories << category
		end
		@item.save
		redirect_to @item
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_url
	end

	def update
		#refactor this
		@item = Item.find(params[:id])
		@categories = params[:categories] || []
		@item.categories = []
		@categories.each do |category|
			category = Category.find(category)
			@item.categories << category
		end

		@item.update(item_params)
		redirect_to @item
	end

	private

	def item_params
		params.require(:item).permit(:title, :description, :price, :image)
	end
end

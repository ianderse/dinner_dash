class CategoriesController < ApplicationController
	def index
		@items = Item.all
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		item_category_id = Category.where(:title => @category.title).first.id
		items_list = ItemCategory.where(:category_id => item_category_id).flatten
		items_ids = items_list.map do |item|
			item.item_id
		end
		@items = items_ids.map do |id|
			Item.where(:id => id)
		end.flatten

	end

	def new
		@category = Category.new
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to @category
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_url
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		redirect_to @category
	end

	private

	def category_params
		params.require(:category).permit(:title, :description)
	end
end

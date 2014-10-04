class CategoriesController < ApplicationController
	load_and_authorize_resource
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

	private

	def category_params
		params.require(:category).permit(:title, :description)
	end
end

class CategoriesController < ApplicationController
	load_and_authorize_resource

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

end

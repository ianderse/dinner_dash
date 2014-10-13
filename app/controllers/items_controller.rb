class ItemsController < ApplicationController
	load_and_authorize_resource

	def index
		@items = Item.active
		@categories = Category.all

    respond_to do |format|
      format.html
      format.pdf { render pdf: "menu" }
    end
	end

	def show
		@item = Item.find(params[:id])
		@reviews = Review.where(item_id: @item.id)
		#can move average to item model?
		if !@reviews.empty?
			@average = @reviews.map do |review|
										review.stars
									end
			@average = @average.reduce(:+) / @reviews.size
		else
			@average = 0
		end
		@categories = @item.categories
	end
end

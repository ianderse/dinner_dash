class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_item, only: [:show]

	def index
    respond_to do |format|
      format.html do
        @items = Item.active
        @categories = Category.all
      end

      format.pdf do
        pdf = MenuPdf.new
        send_data pdf.render, filename: "caussa.pdf", disposition: "inline"
      end
    end

	end

	def show
		@reviews = Review.where(item_id: @item.id)
		if !@reviews.empty?
			@average = @item.average_rating
		else
			@average = 0
		end
		@categories = @item.categories
	end

  private
    
    def set_item
      @item = Item.find(params[:id])
    end
end

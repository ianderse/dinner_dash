class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_item, only: [:show]

	def index
		@items = Item.active
		@categories = Category.all

    respond_to do |format|
      format.html
      format.pdf do
        pdf = MenuPdf.new
        send_data pdf.render, filename: "menu.pdf", disposition: "inline"
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

class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_item, only: [:show]

	def index
    @items = Item.active
    @categories = Category.all
  end

  def menu
    respond_to do |format|
      format.html
      format.pdf do
        pdf = MenuPdf.new
        disposition = params[:disposition]
        send_data pdf.render, filename: "caussa.pdf", disposition: disposition
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

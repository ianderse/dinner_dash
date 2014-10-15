class OrdersController < ApplicationController
	load_and_authorize_resource

	def new
		@order = Order.new
	end

	def index
	end

	def create
		order = Order.new(order_params)
    order.build(cart, current_user)
    cart.clear

		if order.save
			flash[:notice] = "Your order has been successfully created!"
			redirect_to order
		else
			flash[:notice] = "Error placing order"
			redirect_to :back
		end
	end

	def show
		@order = Order.includes(:items).find(params[:id])
		@items = @order.items.group_by(&:id).values
	end

	private

	def order_params
		params.require(:order).permit(:street_number, :street, :city, :state, :zip, :exchange, :status)
	end
end

class OrdersController < ApplicationController
	load_and_authorize_resource

	def new
		@order = Order.new
	end

	def index
	end

	def create
		# raise params.inspect
		order = Order.new(order_params)

		cart = Cart.new(session[:cart])
		cart = cart.items_to_quantities
		cart.each do |item|
			item[1].times do
				order.items << item[0]
			end
		end

		order.user = current_user

    session[:cart].clear

		if order.save
			flash[:notice] = "Your order has been successfully created!"
			redirect_to order
		else
			flash[:notice] = "Error placing order"
			redirect_to :back
		end
	end

	def show
		@order = Order.find(params[:id])
		@items = @order.items.group_by(&:id).values
	end

	private

	def order_params
		params.require(:order).permit(:street_number, :street, :city, :state, :zip, :exchange, :status)
	end

end

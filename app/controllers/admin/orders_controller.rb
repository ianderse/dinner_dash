class Admin::OrdersController < Admin::Controller
	load_and_authorize_resource

	def index
		@orders = Order.all
	end

	def edit

	end

	def update

	end

	def destroy

	end

end

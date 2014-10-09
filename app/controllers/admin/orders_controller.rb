class Admin::OrdersController < Admin::Controller
	load_and_authorize_resource

	def index
		@orders = Order.all
	end

	def edit
		@order = Order.find(params[:id])
    @order_items = @order.items_to_quantities
	end

	def update_quantity
		@order = Order.find(params[:order_id])
    item_id = params[:item_id]
    @order.update_quantity(item_id, params[:quantity])

    respond_to do |format|
      format.js { @order }
    end
	end

	def remove_item
    @item_id = params[:item_id]
    @order = Order.find(params[:order_id])
    @order.items.destroy(@item_id)

    respond_to do |format|
      format.js { @item_id; @order }
    end
  end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		flash[:notice]="Your shit is destroyed"
		redirect_to admin_orders_path
	end

	def status
		@order = Order.find(params[:id])
		@order.status = params[:status]
		@order.save
		respond_to do |format|
			format.js { @order }
		end
	end

end

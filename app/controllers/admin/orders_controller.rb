class Admin::OrdersController < Admin::BaseController
	load_and_authorize_resource

	def index
		@orders       = Order.all
		@ordered      = Order.where(:status => 'ordered')
		@paid         = Order.where(:status => 'paid')
		@completed    = Order.where(:status => 'completed')
		@cancelled    = Order.where(:status => 'cancelled')
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
    if @order.items.empty?
    	@order.status = "cancelled"
    end
    @order.save
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

	def updated_at
		@order = Order.find(params[:id])
		@order.updated_at = params[:updated_at]
		@order.save
		respond_to do |format|
			format.js { @order }
		end
	end

	def custom_show
		@orders = Order.where(:status => params[:status])
		@status = params[:status]
	end

end

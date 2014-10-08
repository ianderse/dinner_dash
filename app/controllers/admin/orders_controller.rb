class Admin::OrdersController < Admin::Controller
	load_and_authorize_resource

	def index
		@orders = Order.all
	end

	def edit
		@order = Order.find(params[:id])
		@items = @order.items
	end

	def update
		# @order = Order.find(params[:id])
    # respond_to do |format|
    #     if @order.toggle!(:paid)
    #         format.html { redirect_to root_url }
    #         format.js
    #     else
    #         format.html { render :index }
    #     end
    # end
		@order = params[:id]
    @order.items.delete(item_id)
    params[:quantity].to_i.times { @order.items << item_id }

    respond_to do |format|
      format.js {}
    end
	end

	def remove_item
    @order = params[:id]
    @order.items.delete(@item_id)

    redirect_to admin_orders_path
  end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		flash[:notice]="Your shit is destroyed"
		redirect_to admin_orders_path
	end

end

class CartController < ApplicationController
  def edit
    @cart_items = session[:cart] || []
    @cart_items = @cart_items.map { |i| Item.find(i) }
    @cart_items = @cart_items.group_by(&:id).values
    #move some of this to model
  end

  def update
    session[:cart] ||= []
    session[:cart] << params[:item_id]
    flash[:notice] = "Item added to your cart!"
    redirect_to request.referer 
  end

  def destroy
    session[:cart].clear
    redirect_to request.referer 
  end
end

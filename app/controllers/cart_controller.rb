class CartController < ApplicationController
  def edit
    @cart_items = params[:cart] || []
  end

  def update
    session[:cart] ||= []
    session[:cart] << params[:item_id]
    flash[:notice] = "Item added to your cart!"
    redirect_to request.referer 
  end

  def destroy
  end
end

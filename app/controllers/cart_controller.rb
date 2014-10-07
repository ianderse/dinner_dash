class CartController < ApplicationController
  def edit
    @cart = Cart.build(session[:cart])
  end

  def add_item
    @item_id = params[:id]
    session[:cart] ||= []
    params[:quantity].to_i.times { session[:cart] << @item_id }

    respond_to do |format|
      format.js { @item_id } 
    end
  end

  def update_quantity
    item_id = params[:id]
    session[:cart].delete(item_id)
    params[:quantity].to_i.times { session[:cart] << item_id }

    respond_to do |format|
      format.js {} 
    end
  end

  def remove_item
    @item_id = params[:id]
    session[:cart].delete(@item_id)

    respond_to do |format|
      format.js { @item_id }
    end
  end

  def destroy
    session[:cart].clear
    redirect_to request.referer 
  end
end

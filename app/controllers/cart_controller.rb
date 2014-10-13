class CartController < ApplicationController
  def edit
    @cart_presenter = CartPresenter.new(current_user)
  end

  def add_item
    @item_id = params[:id]
    cart.add_item @item_id, quantity: params[:quantity]

    respond_to do |format|
      format.js { @item_id }
    end
  end

  def update_quantity
    item_id = params[:id]
    cart.update_quantity(item_id, quantity: params[:quantity])

    respond_to do |format|
      format.js {}
    end
  end

  def remove_item
    @item_id = params[:id]
    cart.delete(@item_id)

    respond_to do |format|
      format.js { @item_id }
    end
  end

  def destroy
    if session[:cart]
      session[:cart].clear
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end

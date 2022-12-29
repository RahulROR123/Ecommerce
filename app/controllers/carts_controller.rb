class CartsController < ApplicationController
  def index
    @cart = current_user.cart
    @cart_item = current_user.cart.cart_items if @cart.present?
  end

  def destroy
    @cart_item = current_user.cart.cart_items.find_by(id: params[:id])
    if @cart_item.present?
       @cart_item.destroy
    end
    redirect_to carts_path, notice: "Succefully remove cart_item"
  end

end

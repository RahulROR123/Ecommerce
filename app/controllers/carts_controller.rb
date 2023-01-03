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
 def update_cart
    cart_item = CartItem.find_by(id: params[:cart_id])
    product_price = cart_item.product.price  
    up_quantity = cart_item.update(product_quantity: params[:product_quantity].to_i, total_price: params[:product_quantity].
      to_i * product_price)
    redirect_to carts_path
  end

end

class OrdersController < ApplicationController
  Razorpay.setup('rzp_test_wrYixxsZmgVEj5', 'BZv1rukXURb10VLLX39XfHuk')
	def create_order
		cart = current_user.cart
		if cart.present? and cart.cart_items.present?
	  	price = cart.total_price * 100
			@order = current_user.orders.new(total_price: price.to_i, total_quantity: cart.total_quantity)
		   cart.cart_items.each do |orderitem|
          @order_item = @order.order_items.new(product_id: orderitem.product_id, total_price: orderitem.total_price, product_quantity: orderitem.product_quantity)
       end   
			if @order.save
       cart.cart_items.delete_all
         order = Razorpay::Order.create(amount: price.to_i, currency: 'INR', receipt: 'TEST')
               @order.update(razorpay_order_id: order.id)
          redirect_to pay_orders_path(order_id: @order.id)
      end

		end

	end
	def pay
    byebug
    @order = Order.find_by(id: params[:id])
 end
end

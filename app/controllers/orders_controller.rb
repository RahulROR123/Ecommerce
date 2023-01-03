class OrdersController < ApplicationController
skip_before_action :verify_authenticity_token
  Razorpay.setup('rzp_test_wrYixxsZmgVEj5', 'BZv1rukXURb10VLLX39XfHuk')
	def create_order
		cart = current_user.cart
		if cart.present? and cart.cart_items.present?
	  	price = cart.total_price * 100
			@order = current_user.orders.new(total_price: price.to_i, total_quantity: cart.total_quantity)
			# redirect_to pay_orders_path(order_id: @order.id)
		   cart.cart_items.each do |order_item|
          @order_item = @order.order_items.new(product_id: order_item.product_id, total_price: order_item.total_price, product_quantity: order_item.product_quantity)
              @order_item.save
       end   
			if @order.save
        cart.cart_items.delete_all
         order = Razorpay::Order.create(amount: price.to_i, currency: 'INR', receipt: 'TEST')
               @order.update(razorpay_order_id: order.id)
          redirect_to order_pay_path(order_id: @order.id)
      end
		end
  end

	def pay
    @order = Order.find_by(id: params[:order_id])
 end


 	def index
 		@order_items = current_user.order_items
     @orders = current_user.orders
   end

	def update_order
		debugger
	      @order = Order.find_by(id: params[:id])
	      if @order.present?
	         payment_response = {
	         	razorpay_order_id: params[:razorpay_order_id], 
	         	razorpay_payment_id: params[:razorpay_payment_id],
	         	 razorpay_signature: params[:razorpay_signature] }

	         verify_result = Razorpay::Utility.verify_payment_signature(payment_response)
	         if verify_result
	            @order.update(razorpay_payment_id: params[:razorpay_payment_id])   
	            redirect_to orders_path
	         else
	            flash[:error] = "something went wrong!!!"
	         end
	      end
	   end

end

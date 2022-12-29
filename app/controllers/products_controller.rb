class ProductsController < ApplicationController
	def create
		@product = current_user.products.new(product_params)
			 if @product.save
			 	redirect_to root_path, notice: "Succefully created product"
			 else
			 	render 'new'
			 end
	end
 def show
 		@product = Product.find(params[:id])
 end

 def edit
    @product = Product.find(params[:id])
  end

	def update
    @product = Product.find(params[:id])
		byebug
 
	  if @product.update(product_params)
	    redirect_to category_path, notice: "Succefully update product"
	   else
	    render 'edit'
	  end
	 end

	def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
    redirect_to categories_path, notice: "Succefully destroy product"
  end
  
  def add_to_cart
    cart = Cart.find_or_create_by(user_id: current_user.id)
     if cart.present?
      product = Product.find_by(id: params[:product_id])
      if cart.cart_items.find_by(product_id: product.id).present?
        redirect_to product_path(product.id), notice: "Product is already in cart"
      else
        cart_item = cart.cart_items.new(product_id: product.id, total_price: product.price, product_quantity: 1)
        if cart_item.save
            redirect_to carts_path
         else  
        end
      end
   end
  
end
  
	def product_params
		params.require(:product).permit(:name, :price, :category_id, :image)		
	end
end

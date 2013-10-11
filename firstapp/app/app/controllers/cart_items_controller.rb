class CartItemsController < ApplicationController
	before_filter :initialize_cart
	
	
	def create		
			if request.post?
			@product = Product.find_by_id(params[:id])				
			if @product.availability<1
				flash.now[:cart_notice] = "Added #{@item.product.name} item to your cart"
				redirect_to @cart
			else
			@item = @cart.add(params[:id])
			flash.now[:cart_notice] = "Added #{@item.product.name} item to your cart"			
			redirect_to @cart
		end
		else
			render
		end
	end

	def destroy		
		if request.delete?
			@cart_items = @cart.cart_items
			@item = @cart_items.find_by_id(params[:id])
			@item = @cart.remove(@item.product.id)
			flash[:cart_notice] = "Removed #{@item.product.name} item from your cart"
			if @cart.total_quantity>0		
				redirect_to @cart
			else
				redirect_to root_path
			end
		else
		render
		end
	end
end

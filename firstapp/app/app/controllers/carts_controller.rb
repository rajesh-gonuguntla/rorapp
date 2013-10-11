class CartsController < ApplicationController
	before_filter :initialize_cart
	before_filter :abandon_cart, only: [:destroy]

	def show
	  	@pagetitle = "Your shopping cart"
	  	@cart = Cart.find_by_id(params[:id])
	  	@cart_items = @cart.cart_items	  
    	respond_to do |format|
      	format.html # show.html.erb
      	format.json { render json: @cart_items }
    end
    end

    def destroy
    	redirect_to root_path
    end
	

	



end

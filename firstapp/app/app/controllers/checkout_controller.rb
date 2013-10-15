class CheckoutController < ApplicationController
    include SessionsHelper  
    before_filter :initialize_cart
    before_filter :signed_in_member, only: [:place_order, :index]
  
  def index
      @order = Order.new
      @page_title = "Checkout"
	 if @cart.products.empty?
	   flash[:notice] = "Your shopping cart is empty! 
	   Please add something to it before proceeding to checkout."
	   redirect_to :controller => 'catalog'
    end
  end

  def place_order
    @page_title = "Checkout"
    @current_member = current_member
    @order = @current_member.orders.create(params[:order])
    
    populate_order
    if @order.save
    if @order.process
    flash[:notice] = 'Your order has been submitted, 
    and will be processed immediately.'
    session[:order_id] = @order.id
    # Empty the cart
    @cart.cart_items.destroy_all
      redirect_to :action => 'thank_you'
    else
    flash[:notice] = "Error while placing order. 
      '#{@order.error_message}'"
    render :action => 'index'
    end
  else
    render :action => 'index'
  end

  end

  def thank_you
    @page_title = 'Thank You!'
  end

  private
    def populate_order
      for cart_item in @cart.cart_items
      order_item = OrderItem.new(
      :product_id => cart_item.product_id,
      :price => cart_item.price,
      :quantity => cart_item.quantity
      )
    @order.order_items << order_item


  end


end

end



class CatalogController < ApplicationController
  before_filter :initialize_cart
  
  def index
      @cart = Cart.find(session[:cart_id])  
	     @page_title = "Products List"
	     @products = Product.paginate(
	     :page => params[:page], :per_page=>1
	     )

  end

  def search
   @cart = Cart.find(session[:cart_id])
   @subCategory = SubCategory.find_by_id(params[:id])
   @products = @subCategory.products.paginate(
  :page => params[:page], :per_page=>1
  )
   redirect_to root_path
  end

  def latest
  end
end

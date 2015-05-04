$product = nil; # store the current viewed product

class HomepageController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
    @current = nil
    @count = nil
    @ran_products = nil
    @new_products = Product.all.last(4)
  end

  def show
    @genres = Genre.all
    @current = nil
    @count = nil
    @products = Product.all    
    @product = Product.find(params[:id])
    $product = @product
    @orders = OrderItem.all

    # get all the comments of a product
    @product_ratings = Rating.where(product_id: @product.id).order(:created_at).reverse_order
  end

  def cart
    if logged_in?
      @order_items = current_user.order_items 
      @items = 0;
      @total = 0;
      @vat = 0;
    else
      redirect_to login_path
    end
  end

  def history
    if logged_in?
      @order_items = current_user.order_items 
      @items = 0;
      @total = 0;
      @vat = 0;
    else
      redirect_to login_path
    end
  end

  def checkout
    all_check_out = ""
    @order_items = current_user.order_items
    @order_items.each do |item|
      if item.status == "pending"
        item.update_attributes(:status => 'in process' )
      end

      prod = Product.find_by_id(item.product_id)
      data = "" + prod.name + " - Quantity: " + item.quantity.to_s + " - Price: " + item.total_price.to_s + ";"
      all_check_out.concat data
    end

    current_user.send_check_out_email(all_check_out)
    redirect_to homepage_cart_path
  end
  
  def category
    @products = Product.all
    @genres = Genre.all
    @genre = Genre.where(@id)
    @url = request.original_fullpath
    @name = @url.split('.').last
  end

  def search_result
    @search = params[:search]
    if params[:search]
      #@genres = Genre.all.pluck(:name)
      @products = Product.search(params[:search])
    else
      #@genres = Genre.all.pluck(:name)
      @products = Product.all
    end
  end
end

$product_comment = nil; # store the current viewed product

class HomepageController < ApplicationController
  def index
    if params[:language]
      $language = params[:language]
      if current_user
        current_user.update_attribute(:language,params[:language])
      end
      redirect_to :back
    end
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
    $product_comment = @product
    @orders = OrderItem.all
    @url = request.original_url

    # update number of views
    @product.update_attributes(:viewed => @product.viewed += 1)
    # get all the comments of a product
    @product_ratings = Rating.where(product_id: $product_comment.id).order(:created_at).reverse_order
  end

  def cart
    @order_items = current_user.order_items 
    if current_user.valid_coupon == true
      @order_items.each do |item|
        item.update_attributes(:discount => '0.5')
      end
    end
    @items = 0;
    @total = 0;
    @vat = 0;
  end

  def history
    @order_items = current_user.order_items
    @items = 0;
    @total = 0;
    @vat = 0;
    @current_order = @order_items.find_by_id(params[:order_id])
    if @current_order != nil
      @current_order.update_attribute(:hide,true)
      redirect_to :back
    end
  end

  def checkout
    
    @coupons = Coupon.all
    @coupon = Coupon.find_by_code(params[:code])
    @order_items = current_user.order_items
    if params[:code] == nil
      @order_items.each do |item|
        if item.status == "pending"
          item.update_attributes(:status => 'in process',:tran_date => Date.today)
        end
      end
      current_user.update_attribute(:valid_coupon, false)
    else 
      if @coupon
        if Date.parse(@coupon.date) == Date.today
          current_user.update_attribute(:valid_coupon, true)
        else
          flash[:alert] = "Invalid coupon code"
          current_user.update_attribute(:valid_coupon, false)
        end
        @coupon.destroy
      else
        flash[:alert] = "Invalid coupon code"
      end
    end
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
    if params[:search]      
      @products = Product.search(params[:search], "Random").order(:viewed).reverse_order
    else      
      @products = Product.all.order(:viewed).reverse_order
    end
  end
end

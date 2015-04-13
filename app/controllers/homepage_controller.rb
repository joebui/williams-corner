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

    # get all the comments of a product
    @product_ratings = Rating.where(product_id: @product.id).order(:created_at).reverse_order
  end

  def cart
  end

  def guide
    
  end

  def login
  end
  
  def category
    @products = Product.all
    @genres = Genre.all
    @genre = Genre.where(@id)
    @url = request.original_fullpath
    @name = @url.split('.').last
  end
end

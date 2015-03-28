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

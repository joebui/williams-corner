class HomepageController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
    @current = nil
    @count = nil
    @ran_products = Product.limit(3).order("RANDOM()")
  end

  def product_detail
  end

  def cart
  end

  def login
  end
end

class ProductsController < ApplicationController
  def index
    if logged_in? && current_user.name == "admin"
      @genres = Genre.all.pluck(:name)
      @products = Product.all
    else
      redirect_to login_path
    end
  end
 
  def show
    @product = Product.find(params[:id])
    @products = Product.all
    @genres = Genre.all
    @current = nil
    @count = nil
  end
 
  def new
    @product = Product.new
    @genres = Genre.all.pluck(:name)
  end
 
  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all.pluck(:name)
  end
 
  def create
    @product = Product.new(product_params)
    @genres = Genre.all.pluck(:name)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end
 
  def update
    @product = Product.find(params[:id])
    @genres = Genre.all.pluck(:name)
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end
 
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
 
  private
    def product_params
      params.require(:product).permit(:name, :genre, :des, :price, :img)
    end
end

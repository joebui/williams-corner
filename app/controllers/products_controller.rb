class ProductsController < ApplicationController
    def index
        if logged_in? && current_user.is_admin == true
            if params[:search]
                @genres = Genre.all.pluck(:name)
                @products = Product.search(params[:search], params[:type])
            else
                @genres = Genre.all.pluck(:name)
                @products = Product.all
            end
        else
            redirect_to root_url
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
        if logged_in? && current_user.is_admin == true
            @product = Product.new
            @genres = Genre.all.pluck(:name)
        else
            redirect_to root_url
        end
    end
 
    def edit
        if logged_in? && current_user.is_admin == true
            @product = Product.find(params[:id])
            @genres = Genre.all.pluck(:name)
        else
            redirect_to root_url
        end
    end
 
    def create
        if logged_in? && current_user.is_admin == true
            @product = Product.new(product_params)
            @genres = Genre.all.pluck(:name)
            if @product.save
                redirect_to products_path
            else
                render 'new'
            end
        else
            redirect_to root_url
        end
    end
 
    def update
        if logged_in? && current_user.is_admin == true
            @product = Product.find(params[:id])
            @genres = Genre.all.pluck(:name)
            if @product.update(product_params)
                redirect_to products_path
            else
                render 'edit'
            end
        else
            redirect_to root_url
        end
    end
 
    def destroy
        if logged_in? && current_user.is_admin == true
            @product = Product.find(params[:id])
            @product.destroy
            redirect_to products_path
        else
            redirect_to root_url
        end
    end
 
    private
    def product_params
        params.require(:product).permit(:name, :genre, :des, :price, :link, :img)
    end
end

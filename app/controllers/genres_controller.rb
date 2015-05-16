class GenresController < ApplicationController
    def index    
        if logged_in? && current_user.is_admin == true
            if params[:search]
                @genres = Genre.search(params[:search])
            else 
                @genres = Genre.all
            end
        else
            redirect_to root_url
        end
    end    
 
    def new
        if logged_in? && current_user.is_admin == true
            @genre = Genre.new
        else
            redirect_to root_url
        end
    end
 
    def edit
        if logged_in? && current_user.is_admin == true
            @genre = Genre.find(params[:id])
        else
            redirect_to root_url
        end
    end
 
    def create
        if logged_in? && current_user.is_admin == true
            @genre = Genre.new(genre_params)
     
            if @genre.save
                redirect_to genres_path
            else
                render 'new'
            end
        else
            redirect_to root_url
        end
    end
 
    def update
        if logged_in? && current_user.is_admin == true
            @genre = Genre.find(params[:id])
            old_genre = @genre.name
            if @genre.update(genre_params)
                @products = Product.all            
                @products.each do |product|
                    if product.genre == old_genre
                        product.update_attributes(:genre => @genre.name)
                    end
                end
                redirect_to genres_path
            else
                render 'edit'
            end
        else
            redirect_to root_url
        end        
    end
 
    def destroy
        if logged_in? && current_user.is_admin == true
            @genre = Genre.find(params[:id])
            genre = @genre
            @products = Product.all
            @products.each do |product|
                product.destroy
            end
            
            @genre.destroy
            redirect_to genres_path
        else
            redirect_to root_url
        end    
    end
 
    private
    def genre_params
        params.require(:genre).permit(:name)
    end
end

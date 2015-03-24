class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
 
  def show
    @genre = Genre.find(params[:id])
  end
 
  def new
    @genre = Genre.new
  end
 
  def edit
    @genre = Genre.find(params[:id])
  end
 
  def create
    @genre = Genre.new(genre_params)
 
    if @genre.save
      redirect_to genres_path
    else
      render 'new'
    end
  end
 
  def update
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
  end
 
  def destroy
    
    @genre = Genre.find(params[:id])
    genre = @genre
    @products = Product.all
    @products.each do |product|
      if product.genre == genre.name 
        product.update_attributes(:genre => "unknown" )
      end
    end
    @genre.destroy
    redirect_to genres_path
  end
 
  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end

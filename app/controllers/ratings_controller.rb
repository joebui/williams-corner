class RatingsController < ApplicationController
	def new
		
	end

	def show
		
	end

	def create
		if logged_in?
			@rating = $product.ratings.create(account_name: current_user.name, comment: params[:rating][:comment], stars: params[:rating][:stars])
			redirect_to :back
		else
			redirect_to login_path
		end
	end	

	def index
		if params[:search]
			@ratings = Rating.search(params[:search])
		else
			@ratings = Rating.all
		end		
	end

	def destroy
		@rating = Rating.find(params[:id])
		@rating.destroy

		redirect_to ratings_path		
	end
end

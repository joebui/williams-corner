class RatingsController < ApplicationController
	def new
		
	end

	def show
		
	end

	def create
		

		if logged_in?
			@url = request.referer 		
			@product_id = @url.split('/').last			
			@product = Product.find_by_id(@product_id.to_i)
			@rating = @product.ratings.create(account_id: current_user.id, comment: params[:rating][:comment], 
				stars: params[:rating][:stars])
			redirect_to :back
		else
			redirect_to login_path
		end
	end	

	def index
		if logged_in? && current_user.is_admin == true
			if params[:search]
				@ratings = Rating.search(params[:search], params[:type])
			else
				@ratings = Rating.all
			end		
		else
			redirect_to root_url
		end
	end

	def destroy
		if logged_in? && current_user.is_admin == true
			@rating = Rating.find(params[:id])
			@rating.destroy
			redirect_to ratings_path		
		else
			redirect_to root_url
		end
	end
end

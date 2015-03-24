class OrdersController < ApplicationController
	def new
		
	end

	def create
		@order = current_user.orders.create(order_date: Time.now, 
			product_id: params[:order][:product_id])
		redirect_to root_url
	end
end

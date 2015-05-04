class AccountActivationsController < ApplicationController
	def edit
	    user = Account.find_by(email: params[:email])
	    if user && !user.activated? && user.authenticated?(:activation, params[:id])
	      user.activate
	      log_in user
	      flash[:success] = "Account activated!"	      
	    else
	      flash[:danger] = "Invalid activation link"	      
	    end

	    redirect_to root_url
  	end
end

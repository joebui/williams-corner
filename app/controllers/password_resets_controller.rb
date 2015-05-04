class PasswordResetsController < ApplicationController
	before_action :get_user,   only: [:edit, :update]
  	before_action :valid_user, only: [:edit, :update]  	
  	# before_action :check_expiration, only: [:edit, :update]

  	def new
  	end

  	def create
		@account = Account.find_by(email: params[:password_reset][:email].downcase)
	    if @account
	      	@account.create_reset_digest
	      	@account.send_password_reset_email
	      	# flash[:info] = "Email sent with password reset instructions"
	      	redirect_to root_url
	    else
	      	flash.now[:alert] = "Email address not found"
	      	render 'new'
	    end
  	end

  	def edit  		  		
  	end

  	def update
  		if password_blank?
	      	flash.now[:alert] = "Password can't be blank"
	      	render 'edit'
	    # elsif @account.update_attribute(:password, params[:account][:password]) && @account.update_attribute(:password_confirmation, params[:account][:password_confirmation])
		elsif @account.update_attributes(user_params)
	      	log_in @account
	      	flash[:success] = "Password has been reset."
	      	redirect_to root_url
	    else
	      	render 'edit'
	    end
  	end  	

  	private

  		def user_params
	      	params.require(:account).permit(:password, :password_confirmation)
	    end

	    # Returns true if password is blank.
	    def password_blank?
	      	params[:account][:password].blank?
	    end

	    def get_user
	      	@account = Account.find_by(email: params[:email])
	    end

	    # Confirms a valid user.
	    def valid_user
	      	unless (@account && @account.activated? &&
              	@account.authenticated?(:reset, params[:id]))
		        redirect_to root_url
	      	end
	    end	    
end

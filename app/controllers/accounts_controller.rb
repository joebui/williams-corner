class AccountsController < ApplicationController
	def new
		@account = Account.new
	end

	def edit				
		if logged_in? && (current_user.name == Account.find(params[:id]).name || current_user.is_admin == true)
			@account = Account.find(params[:id])
		else
			redirect_to root_url
		end
	end

	def create
		@account = Account.new(account_params)
		@account.is_admin = false
		if @account.save
			@account.send_activation_email
      		flash[:notice] = "Please check your email to activate your account."      
			redirect_to homepage_message_path			
		else
			render 'new'
		end	
	end	

	def update
		@account = Account.find(params[:id])

		if logged_in? && current_user.name == @account.name
			if @account.update_attributes(account_params)				
				redirect_to root_url				
			else
			    render 'edit'
		    end
		elsif logged_in? && current_user.is_admin == true			
			if @account.update_attribute(:is_admin, params[:account][:is_admin])				
				redirect_to accounts_path				
			else
			    render 'edit'
		    end
		else
			redirect_to root_url
		end
	end

	def index
		if logged_in? && current_user.is_admin == true
			if params[:search]
				@accounts = Account.search(params[:search], params[:type])
			else
				@accounts = Account.all
			end
		else
			redirect_to root_url
		end
	end	

	def destroy
		if logged_in? && current_user.is_admin == true
			@account = Account.find(params[:id])
			@account.destroy

			redirect_to accounts_path		
		else
			redirect_to root_url
		end
	end

	private
	def account_params
		params.require(:account).permit(:name, :email, :is_admin, :password, :password_confirmation, :language)
	end

	private	
 	def update_resource(resource, params)
 		params.require(:account).permit(:is_admin)
    	resource.update_without_password(params)
  	end

  	private
	def create_activation_digest
    	# Create the token and digest.
  	end
end

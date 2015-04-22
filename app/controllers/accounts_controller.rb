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
		@account.is_admin = false;
		if @account.save
			log_in @account
			redirect_to root_url
		else
			render 'new'
		end	
	end	

	def update
		@account = Account.find(params[:id])

		if logged_in? && current_user.is_admin == false
			if @account.update_attributes(account_params)				
				redirect_to root_url				
			else
			    render 'edit'
		    end
		elsif logged_in? && current_user.is_admin == true			
			if @account.update_attribute(account_params)				
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
				@accounts = Account.search(params[:search])
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
		params.require(:account).permit(:name, :email, :is_admin, :password, :password_confirmation)
	end

	private	
 	def update_resource(resource, params)
 		params.require(:account).permit(:is_admin)
    	resource.update_without_password(params)
  	end
end

class AccountsController < ApplicationController
	def new
		@account = Account.new
	end

	def edit
		@account = Account.find(params[:id])
	end

	def create
		@account = Account.new(account_params)
		if @account.save
			log_in @account
			redirect_to root_url
		else
			render 'new'
		end	
	end	

	def update
		@account = Account.find(params[:id])

		if current_user.name == @account.name || current_user.name == "admin"
			if @account.update(account_params)
				if current_user.name == "admin"
			    	redirect_to accounts_path
			    else
					redirect_to root_url
				end    	
			else
			    render 'edit'
		    end
		else
			redirect_to root_url
		end
	end

	def show
		@account = Account.find(params[:id])
	end

	def index
		if logged_in? && current_user.name == "admin"
			if params[:search]
				@accounts = Account.search(params[:search])
			else
				@accounts = Account.all
			end
		else
			redirect_to login_path
		end
	end	

	def destroy
		@account = Account.find(params[:id])
		@account.destroy

		redirect_to accounts_path		
	end

	private
	def account_params
		params.require(:account).permit(:name, :email, :password, :password_confirmation)
	end
end

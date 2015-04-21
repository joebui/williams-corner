class SessionsController < ApplicationController
  def new
  end

  def create
    user = Account.find_by(name: params[:session][:name])
    
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      if current_user.is_admin == true
        redirect_to products_path
      else
        redirect_to root_url
      end
    else
      flash[:alert] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
  	  log_out
      redirect_to root_url
  end
end

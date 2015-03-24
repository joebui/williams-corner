class SessionsController < ApplicationController
  def new
  end

  def create
    name = Account.find_by(name: params[:session][:name])
    pass = Account.find_by(password: params[:session][:password])
    if name && pass
      log_in name
      if current_user.name == "admin"
        redirect_to products_path
      else
        redirect_to root_url
      end
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	  log_out
      redirect_to root_url
  end
end

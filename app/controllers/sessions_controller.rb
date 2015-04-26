class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"] current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
    redirect_to root_url

    # user = Account.find_by(name: params[:session][:name])
    
    # if user && user.authenticate(params[:session][:password])
    #   if user.activated?
    #     log_in user
    #     remember user
    #     redirect_to products_path
    #   else        
    #     flash[:alert] = "Account not activated. Check your email for the activation link."
    #     render 'new'
    #   end
    # else
    #   flash[:alert] = "Invalid email/password combination"
    #   render 'new'
    # end
  end

  def destroy
  	  log_out
      redirect_to root_url
  end
end

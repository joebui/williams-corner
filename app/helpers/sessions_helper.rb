module SessionsHelper
	# Logs in the given user.
  	def log_in(user)
    	session[:user_id] = user.id
  	end

    def remember(user)
      user.remember
      cookies.permanent.signed[:user_id] = user.id
      cookies[:remember_token] = { value: user.remember_token,
                             expires: 6.months.from_now.utc }
    end

    def forget(user)
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end

  	# Logs out the current user.
  	def log_out
      forget(current_user)
    	session.delete(:user_id)
    	@current_user = nil
  	end

  	# Returns the current logged-in user (if any).
	def current_user
	    if (user_id = session[:user_id])
        @current_user ||= Account.find_by(id: user_id)
      elsif (user_id = cookies.signed[:user_id])
        user = Account.find_by(id: user_id)
        if user && user.authenticated?(:remember, cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
	end

	# Returns true if the user is logged in, false otherwise.
  	def logged_in?
    	!current_user.nil?
  	end
end

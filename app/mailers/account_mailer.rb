class AccountMailer < ApplicationMailer  
  def account_activation(account) 
    @account = account   
    mail to: account.email, subject: "Account activation"
  end
  
  def password_reset(account) 
    @account = account
    mail to: account.email, subject: "Password reset"
  end  

  def all_check_out(account, check_out)
    @account = account
    @check_out = check_out
    mail to: account.email, subject: "Delivered product"
  end

  def send_coupon(account, code)
    @account = account;
    @code = code
    mail to: account.email, subject: "New coupon"
  end
end

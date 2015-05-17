# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_mailer/account_activation
  def account_activation
    user = Account.first
    user.activation_token = Account.new_token
    AccountMailer.account_activation(user)
  end

  def password_reset
    user = Account.first
    user.reset_token = Account.new_token
    AccountMailer.password_reset(user)
  end

  def all_check_out
    user = Account.first    
    AccountMailer.all_check_out(user, "AC IV - Quantity: 1;AC Unity - Quantity: 3")
  end

  def send_coupon
    user = Account.first
    AccountMailer.send_coupon(user, "fhjksahfks37498235")
  end
end

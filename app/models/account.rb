class Account < ActiveRecord::Base  
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save { self.email = email.downcase }
  before_create :create_activation_digest

  has_many :order_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true, length: {minimum: 5}, allow_blank: false
  validates :password_confirmation, presence: true
  
  has_secure_password
  
  def self.search(search, type)   
      if type == "Name"
        where("name LIKE ?", "%#{search}%")   
      elsif type == "Email"
        where("email LIKE ?", "%#{search}%")   
      elsif type == "Activated"
        if search == true || search == false
          where("activated = ?", search)    
        else
          all
        end
      elsif type == "Admin"        
        if search == true || search == false
          where("is_admin = ?", search)         
        else
          all
        end
      end
  end

  def Account.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
  end

  def Account.new_token
      SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Account.new_token
    update_attribute(:remember_digest, Account.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
      self.activation_token  = Account.new_token
      self.activation_digest = Account.digest(activation_token)
  end

  # Sets the password reset attributes.
  def create_reset_digest
      self.reset_token = Account.new_token
      update_attribute(:reset_digest,  Account.digest(reset_token))
      update_attribute(:reset_sent_at, Time.now)
  end

  # Sends password reset email.
  def send_password_reset_email
      AccountMailer.password_reset(self).deliver_now
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    AccountMailer.account_activation(self).deliver_now
  end

  def send_check_out_email(check_out)
    AccountMailer.all_check_out(self, check_out).deliver_now
  end
end
